resource "azurerm_availability_set" "linux_avail_set" {
  name                         = "n01617983-LINUX-AVSET"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  tags                         = var.tags
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each              = toset(var.linux_vm_names)  # Create 3 Linux VMs
  name                  = each.value
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_B1ms"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  availability_set_id   = azurerm_availability_set.linux_avail_set.id
  tags                  = var.tags

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("/home/n01617983/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}

resource "azurerm_network_interface" "linux_nic" {
  for_each            = toset(var.linux_vm_names)  # Create 3 NICs
  name                = "${each.value}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each             = toset(var.linux_vm_names)  # Create 3 extensions
  name                 = "${each.value}-network-watcher"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each             = toset(var.linux_vm_names)  # Create 3 extensions
  name                 = "${each.value}-azure-monitor"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.5"  # Use the latest version
  tags                 = var.tags
}

resource "azurerm_virtual_machine_extension" "custom_extension" {
  for_each             = toset(var.linux_vm_names)  # Create 3 extensions
  name                 = "${each.value}-custom-extension"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  tags                 = var.tags

  settings = <<SETTINGS
    {
      "commandToExecute": "echo Hello, World!"
    }
  SETTINGS
}
