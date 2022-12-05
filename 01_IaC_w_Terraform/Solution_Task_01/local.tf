locals {
  localhost             = var.vm_host != "" ? "http://${var.vm_host}" : "http://localhost"
  docker_socket_address = var.vm_host != "" ? "tcp://${var.vm_host}:2375/" : var.docker_socket_host
}