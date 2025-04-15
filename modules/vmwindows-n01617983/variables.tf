variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VM"
  type        = string
}

variable "storage_account_uri" {
  description = "URI of the storage account for boot diagnostics"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "windows_public_ip_id" {
  description = "ID of the public IP address for the Windows VM"
  type        = string
}
