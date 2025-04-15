resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "n01617983-LOG-ANALYTICS"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = "n01617983-RECOVERY-VAULT"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "n01617983storageaccount"
  resource_group_name      = var.resource_group_name
  location                = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
