terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
  backend "azurerm" {
      storage_account_name = "devtfstatestorage01"
      container_name       = "infra-container"
      key                  = "dev-infra-statefile.tfstate"
      resource_group_name = "rg-terraform-state"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
