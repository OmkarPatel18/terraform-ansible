resource "azurerm_lb" "loadbalancer" {
  name                = "n01617983-LOADBALANCER"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"
  tags                = var.tags

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.lb_pip.id
  }
}

data "azurerm_public_ip" "lb_pip" {
  name                = "n01617983-LB-PIP"
  resource_group_name = var.resource_group_name
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "HTTP-Probe"
  port            = 80
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.loadbalancer.id
  name                           = "HTTP-Rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.lb_probe.id
}

#resource "azurerm_network_interface_backend_address_pool_association" "nic_association" {
#  for_each                = var.vm_nics  # Associate NICs with the backend pool
#  network_interface_id    = each.value
#  ip_configuration_name   = "internal"
#  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
#}
