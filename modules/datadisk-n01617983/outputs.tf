#output "datadisk_ids" {
#  value = [for disk in azurerm_managed_disk.datadisk : disk.id]
#}
