variable "vm_name" {
  description = "Name of the virtual-machine"
  type        = string
}


variable "rg_name" {
  description = "Name of resource group to place the virtual-machine in"
  type        = string
}

variable "rg_location" {
  description = "Location of resource group to place the virtual-machine in"
  type        = string
}

variable "subnet_id" {
  description = "Id of the subnet to place the virtual-machine in"
  type        = string
}

variable "folder_transfer_tmp" {
  description = "Folder, the content of which, to be transfered to the /tmp/ folder inside the VM. Eg folder is /foo it will be uploaded to /tmp/foo. If the source is /foo/ (a trailing slash is present), then the contents of /foo will be uploaded directly into /tmp."
  type        = string
  default     = ""
}
