resource "null_resource" "display_hostnames" {
  for_each = toset(var.linux_vm_names)

  depends_on = [
    azurerm_linux_virtual_machine.linux_vm,
    azurerm_network_interface.linux_nic,
  ]

#  provisioner "remote-exec" {
#    inline = [
#      "echo Hostname: ${each.value}"
#    ]
#
#    connection {
#     type     = "ssh"
#      host     = azurerm_network_interface.linux_nic[each.key].private_ip_address
#     user     = "adminuser"
#      private_key = file("/home/n01617983/.ssh/id_rsa")
#    }
#  }
}
