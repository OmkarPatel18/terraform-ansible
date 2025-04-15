module "rgroup" {
  source              = "./modules/rgroup-n01617983"
  resource_group_name = "n01617983-RG" 
  location            = var.location
  tags                = var.tags
}

module "network" {
  source              = "./modules/network-n01617983"
  resource_group_name = module.rgroup.resource_group_name
  vnet_name           = "n01617983-VNET"  
  subnet_name         = "n01617983-SUBNET" 
  location            = var.location
  tags                = var.tags
}

module "common" {
  source              = "./modules/common-n01617983"
  resource_group_name = module.rgroup.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "vmlinux" {
  source              = "./modules/vmlinux-n01617983"
  resource_group_name = module.rgroup.resource_group_name
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_uri
  location            = var.location
  tags                = var.tags
  linux_vm_names      = ["n01617983-linux-vm1", "n01617983-linux-vm2", "n01617983-linux-vm3"]
  linux_public_ip_id  = module.loadbalancer.loadbalancer_public_ip
  loadbalancer_public_ip = module.loadbalancer.loadbalancer_public_ip
}

#module "vmwindows" {
#  source              = "./modules/vmwindows-n01617983"
#  resource_group_name = module.rgroup.resource_group_name
#  subnet_id           = module.network.subnet_id
#  storage_account_uri = module.common.storage_account_uri 
#  location            = var.location                      
#  tags                = var.tags                          
#  windows_public_ip_id = module.loadbalancer.loadbalancer_public_ip_id
#}

module "datadisk" {
  source              = "./modules/datadisk-n01617983"
  resource_group_name = module.rgroup.resource_group_name
  vm_ids              = module.vmlinux.vm_ids
  location            = var.location
  tags                = var.tags
}

module "loadbalancer" {
  source              = "./modules/loadbalancer-n01617983"
  resource_group_name = module.rgroup.resource_group_name
  vm_nics             = module.vmlinux.vm_nics
  location            = var.location
  tags                = var.tags
}

module "database" {
  source              = "./modules/database-n01617983"
  resource_group_name = module.rgroup.resource_group_name
  location            = var.location
  tags                = var.tags    
}

resource "azurerm_public_ip" "linux_pip" {
  name                = "n01617983-linux-pip"
  location            = var.location
  resource_group_name = module.rgroup.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
  tags                = var.tags
}

#resource "azurerm_public_ip" "windows_pip" {
#  name                = "n01617983-windows-pip"
#  location            = var.location
#  resource_group_name = module.rgroup.resource_group_name
#  allocation_method   = "Static"
#  sku                 = "Basic"
#  tags                = var.tags
#}
