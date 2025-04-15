variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}

variable "tags" {
  description = "Tags for the resource group"
  type        = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "omkar.patel"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
