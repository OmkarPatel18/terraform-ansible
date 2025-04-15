variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_nics" {
  description = "Map of NIC IDs for the backend pool"
  type        = map(string)
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}
