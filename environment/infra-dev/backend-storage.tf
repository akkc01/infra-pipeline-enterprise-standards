terraform {
  backend "azurerm" {
    storage_account_name = "jarvisinfrastate"
    container_name       = "jarvisinfrastate"
    key                  = "infra-prod.terraform.tfstate"
    resource_group_name  = "value"
  }
}
