#resource "azurerm_availability_set" "windows_avail_set" {
# name                         = "n91617983-WINDOWS-AVSET"
#  location                     = var.location
# resource_group_name          = var.resource_group_name
#  platform_fault_domain_count  = 2
#  platform_update_domain_count = 2
#  tags                         = var.tags
#}

#resource "azurerm_windows_virtual_machine" "windows_vm" {
#  name                  = "n01617983-windows-vm"
#  computer_name         = "win-vm"  # Explicitly set the computer name
#  resource_group_name   = var.resource_group_name
#  location              = var.location
#  size                  = "Standard_B1ms"
#  admin_username        = "adminuser"
#  admin_password        = "P@ssw0rd1234!"
#  network_interface_ids = [azurerm_network_interface.windows_nic.id]
#  availability_set_id   = azurerm_availability_set.windows_avail_set.id
#  tags                  = var.tags

#  os_disk {
#    caching              = "ReadWrite"
#    storage_account_type = "Standard_LRS"
#  }

#  source_image_reference {
#    publisher = "MicrosoftWindowsServer"
#    offer     = "WindowsServer"
#    sku       = "2016-Datacenter"
#    version   = "latest"
#  }

#  boot_diagnostics {
#    storage_account_uri = var.storage_account_uri
#  }
#}

#resource "azurerm_network_interface" "windows_nic" {
#  name                = "n91617983-windows-nic"
#  location            = var.location
#  resource_group_name = var.resource_group_name
#  tags                = var.tags

#  ip_configuration {
#    name                          = "internal"
#    subnet_id                     = var.subnet_id
#    private_ip_address_allocation = "Dynamic"
#  }
#}

#resource "azurerm_virtual_machine_extension" "antimalware" {
#  name                 = "n01617983-windows-antimalware"
#  virtual_machine_id   = azurerm_windows_virtual_machine.windows_vm.id
#  publisher            = "Microsoft.Azure.Security"
#  type                 = "IaaSAntimalware"
#  type_handler_version = "1.3"
#  tags                 = var.tags
#}
