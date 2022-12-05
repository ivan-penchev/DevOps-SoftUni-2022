output "docker_image_db_installed" {
  value = docker_image.db.image_id
}

output "docker_image_web_installed" {
  value = docker_image.web.image_id
}

output "web_application_url" {
  value = "${local.localhost}:${docker_container.web.ports[0].external}"
}