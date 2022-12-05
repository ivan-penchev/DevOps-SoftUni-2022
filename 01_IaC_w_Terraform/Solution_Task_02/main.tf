locals {
  module_key_with_application_source_code = "app_source"
  database_seed_file_name                 = "db_setup.sql"
  database_bootstrap_file_name            = "bootstrapDB.sh"
  web_bootstrap_file_name                 = "bootstrapNGINX.sh"
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = "West Europe"
}

module "db" {
  source              = "./vm"
  vm_name             = "db"
  rg_name             = azurerm_resource_group.rg.name
  rg_location         = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.snet.id
  folder_transfer_tmp = "./vm_config/db/"
  depends_on = [
    module.app_source
  ]
}

module "web" {
  source              = "./vm"
  vm_name             = "web"
  rg_name             = azurerm_resource_group.rg.name
  rg_location         = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.snet.id
  folder_transfer_tmp = "./vm_config/web/"
  depends_on = [
    module.app_source,
    module.app_config
  ]
}


resource "null_resource" "db_bootstrap" {

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/${local.database_bootstrap_file_name}",
      "/tmp/${local.database_bootstrap_file_name}",
    ]
    connection {
      type     = "ssh"
      user     = module.db.username
      password = module.db.password
      host     = module.db.public_ip
    }
  }
}

resource "null_resource" "db_seed" {

  provisioner "file" {
    source      = ".terraform/modules/${local.module_key_with_application_source_code}/db/${local.database_seed_file_name}"
    destination = "/tmp/${local.database_seed_file_name}"
    connection {
      type     = "ssh"
      user     = module.db.username
      password = module.db.password
      host     = module.db.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mysql -u root < /tmp/${local.database_seed_file_name}",
      "exit"
    ]
    connection {
      type     = "ssh"
      user     = module.db.username
      password = module.db.password
      host     = module.db.public_ip
    }
  }
  depends_on = [null_resource.db_bootstrap]
}

resource "null_resource" "web_bootstrap" {

  provisioner "file" {
    source      = ".terraform/modules/${local.module_key_with_application_source_code}/web/"
    destination = "/tmp"
    connection {
      type     = "ssh"
      user     = module.web.username
      password = module.web.password
      host     = module.web.public_ip
    }
  }

  provisioner "file" {
    source      = module.app_config.config_filepath
    destination = "/tmp/config.php"
    connection {
      type     = "ssh"
      user     = module.web.username
      password = module.web.password
      host     = module.web.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/${local.web_bootstrap_file_name}",
      "/tmp/${local.web_bootstrap_file_name}",
    ]
    connection {
      type     = "ssh"
      user     = module.web.username
      password = module.web.password
      host     = module.web.public_ip
    }
  }
}
