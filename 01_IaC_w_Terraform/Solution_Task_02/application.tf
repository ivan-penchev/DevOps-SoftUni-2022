module "app_source" {
  source = "git::https://github.com/shekeriev/bgapp.git?ref=49f498ef148d0c463383467bf396393f115f7e85"
}

module "app_config" {
  source        = "./app_config"
  database_host = module.db.private_ip
}
