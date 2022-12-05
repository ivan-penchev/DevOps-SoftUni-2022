variable "vm_host" {
  description = "IP address of VM"
  type        = string
  default     = ""
}

variable "docker_socket_host" {
  description = "Docker daemon host, defaults to local"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "dockerhub_db_image_name" {
  description = "Name of database server image"
  type        = string
  default     = "shekeriev/bgapp-db:latest"
}

variable "dockerhub_web_image_name" {
  description = "Name of web server image"
  type        = string
  default     = "shekeriev/bgapp-web:embedded"
}

variable "docker_network" {
  description = "Name of docker network to use"
  type        = string
  default     = "application-network"
}

variable "database_password" {
  description = "Passsword used by the database server"
  type        = string
  default     = ""
  validation {
    condition     = length(var.database_password) > 0
    error_message = "The database_password must be filled in."
  }
}