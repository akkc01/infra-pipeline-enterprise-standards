module "rg" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "storage" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_storage_account"
  stgaccount = var.stgaccount
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_vnet"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.rg, module.vnet]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "pips" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
}