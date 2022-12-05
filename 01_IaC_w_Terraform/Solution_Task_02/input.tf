variable "rg_name" {
  description = "Name of resource group to create"
  type        = string
  default     = "default-rg-name-terraform"
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type    = string
  default = ""
}

variable "client_secret" {
  type    = string
  default = ""
}

