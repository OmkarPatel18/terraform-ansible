output "windows_vm_hostname" {
  value = azurerm_windows_virtual_machine.windows_vm.name
}

output "windows_vm_private_ip" {
  value = azurerm_network_interface.windows_nic.private_ip_address
}

output "vm_id" {
  value = { "windows-vm" = azurerm_windows_virtual_machine.windows_vm.id }
}
