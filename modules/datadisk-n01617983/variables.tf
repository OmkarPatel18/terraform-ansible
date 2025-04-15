variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_ids" {
  description = "Map of VM IDs to attach data disks"
  type        = map(string)
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}
