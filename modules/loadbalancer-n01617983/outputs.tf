output "loadbalancer_public_ip" {
  value = data.azurerm_public_ip.lb_pip.ip_address
}

output "loadbalancer_public_ip_id" {
  value = data.azurerm_public_ip.lb_pip.id
}

output "load_balancer_name" {
  value = azurerm_lb.loadbalancer.name
}
