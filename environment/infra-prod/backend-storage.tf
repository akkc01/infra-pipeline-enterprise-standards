terraform {
  backend "azurerm" {
    storage_account_name = "devtfstatestorage01"
    container_name       = "infra-container"
    key                  = "prod-infra-statefile.tfstate"
    resource_group_name  = "rg-terraform-state"
  }
}
