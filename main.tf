terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }

  backend "remote" {
    organization = "satyam-patel-trident"
    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "fafa58df-5f3a-4423-91ba-552d42b280dd"
  client_id       = "QSr8Q~u3CzOOngmyTDKuSzor4p~N2HFpC535Ga3Y"
  client_secret   = "c9c41253-efbb-4ca2-9a82-efc0d3882eaa"
  tenant_id       = "ce3685eb-9b4e-4652-a942-7ea5cda9e6c0"
  
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}
