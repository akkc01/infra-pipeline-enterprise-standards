module "rg" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "storage" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_storage_account"
  stgaccount = var.stgaccount
  rg_names   = module.rg.names
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_vnet"
  vnets      = var.vnets
  rg_names   = module.rg.names
}

module "subnet" {
  depends_on = [module.rg, module.vnet]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
  rg_names   = module.rg.names
}

