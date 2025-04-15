variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VMs"
  type        = string
}

variable "storage_account_uri" {
  description = "URI of the storage account for boot diagnostics"
  type        = string
}

variable "linux_public_ip_id" {
  description = "Public IP ID"
  type        = string
  default     = null
}

variable "linux_vm_names" {
  description = "Names of the Linux VMs"
  type        = list(string)
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "loadbalancer_public_ip" {
  description = "Load Balancer Public IP"
  type        = string
  default     = null
}
