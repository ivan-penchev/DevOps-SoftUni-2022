output "database_public_ip" {
  value = "http://${module.db.public_ip}"
}

output "webserver_public_ip" {
  value = "http://${module.web.public_ip}"
}

output "vms_private_ips" {
  value = [module.web.private_ip, module.db.private_ip]
}
