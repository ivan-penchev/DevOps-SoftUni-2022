resource "azurerm_network_interface" "vm" {
  name                = "${var.vm_name}nic"
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  resource_group_name             = var.rg_name
  location                        = var.rg_location
  size                            = "Standard_B1s"
  disable_password_authentication = "false"
  admin_username                  = "adminuser"
  admin_password                  = "TerraformRulez!"
  network_interface_ids = [
    azurerm_network_interface.vm.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}


resource "azurerm_public_ip" "pip" {
  name                = "${var.vm_name}pip"
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Dynamic"
}

resource "null_resource" "folder_transfer" {

  count = var.folder_transfer_tmp == "" ? 0 : 1

  provisioner "file" {
    // TODO: This has to check if the folder to transfer ends with trailing slash
    // https://developer.hashicorp.com/terraform/language/resources/provisioners/file#directory-uploads
    source      = var.folder_transfer_tmp
    destination = "/tmp"
    connection {
      type     = "ssh"
      user     = azurerm_linux_virtual_machine.vm.admin_username
      password = azurerm_linux_virtual_machine.vm.admin_password
      host     = azurerm_linux_virtual_machine.vm.public_ip_address
    }
  }

  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]
}
