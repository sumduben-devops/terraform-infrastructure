module "resource_group" {
  source = "../child_module/azurerm_resource_group"
  RGs    = var.RGs
}

module "stoarge_account" {
  source     = "../child_module/azurerm_storage_account"
  SAs        = var.SAs
  depends_on = [module.resource_group]
}

module "Virtual_network" {
  source     = "../child_module/azurerm_virtual_network"
  VNETs      = var.VNETs
  depends_on = [module.resource_group]
}

module "subnet" {
  source     = "../child_module/azurerm_subnet"
  SNETs      = var.SNETs
  depends_on = [module.Virtual_network]
}

module "public_ip" {
  source     = "../child_module/azurerm_public_ip"
  PIPs       = var.PIPs
  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source     = "../child_module/azurerm_virtual_machine"
  VMs        = var.VMs
  depends_on = [module.public_ip, module.subnet]
}