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


#   subscription_id = "8b600cf5-d87c-4bb5-b69f-1bacd64f2b97"
#   tenant_id       = "08a5a19c-7bb6-4241-9785-f035b360699a"
#   client_id       = "fdc62387-d1d0-49e9-b9e7-80a9c4ffa347"
#   client_secret   = "a_H8Q~U4_iQLLaQfRuwtHLhMuv9UKcZuefNgYbcE"
