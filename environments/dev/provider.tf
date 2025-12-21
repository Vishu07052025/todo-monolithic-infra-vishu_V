terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.49.0"
    }
  }
  backend "azurerm" {
  container_name       = "container-backend-dev-vishu"
  resource_group_name  = "rg-backend-dev-vishu"
  storage_account_name = "strgbackenddevvishu"
  key                  = "dev-vishu.tfstate"

  }
}
provider "azurerm" {
  features {}
  subscription_id = "426a305f-f503-4960-8345-66640721b789"
}
