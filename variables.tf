variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "omkar.patel"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

variable "linux_vm_names" {
  description = "Names of the Linux VMs"
  type        = list(string)
  default     = ["n01617983-linux-vm1", "n01617983-linux-vm2", "n01617983-linux-vm3"]
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "n01617983-RG"
}
