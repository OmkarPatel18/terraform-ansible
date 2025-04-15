output "resource_group_name" {
  value = module.rgroup.resource_group_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "linux_vm_hostnames" {
  value = module.vmlinux.linux_vm_hostnames
}

#output "windows_vm_hostname" {
#  value = module.vmwindows.windows_vm_hostname
#}

#output "windows_vm_private_ip" {
#  value = module.vmwindows.windows_vm_private_ip
#}

#output "windows_vm_id" {
#  value = module.vmwindows.vm_id
#}

output "load_balancer_name" {
  value = module.loadbalancer.load_balancer_name  # Correct reference
}

output "database_name" {
  value = module.database.database_name
}
