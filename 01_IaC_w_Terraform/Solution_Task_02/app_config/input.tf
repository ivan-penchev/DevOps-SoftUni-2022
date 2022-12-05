variable "database_name" {
  description = "Name of the database to be inserted in the config"
  type        = string
  default     = "bulgaria"
}

variable "database_user" {
  description = "Name of the database user to be inserted in the config"
  type        = string
  default     = "web_user"
}

variable "database_passsword" {
  description = "Database password to be inserted in the config"
  type        = string
  default     = "Password1"
}

variable "database_host" {
  description = "Database host url to be inserted in the config"
  type        = string
  default     = "db"
}