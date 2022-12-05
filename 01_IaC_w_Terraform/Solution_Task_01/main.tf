resource "docker_image" "web" {
  name = var.dockerhub_web_image_name
}

resource "docker_image" "db" {
  name = var.dockerhub_db_image_name
}

resource "docker_network" "application" {
  name = var.docker_network
}

resource "docker_container" "db" {
  name  = "db"
  image = docker_image.db.image_id

  networks_advanced {
    name    = docker_network.application.name
    aliases = [var.docker_network]
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${var.database_password}"
  ]
}

resource "docker_container" "web" {
  name  = "web"
  image = docker_image.web.image_id

  networks_advanced {
    name    = docker_network.application.name
    aliases = [var.docker_network]
  }

  ports {
    internal = 80
    external = 8000
  }
}