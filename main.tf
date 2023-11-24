terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "satyam-patel-trident"

    workspaces {
      name = "gh-actions-demo-java"
    }
  }
}
provider "azurerm" {
  features {}

  subscription_id = "fafa58df-5f3a-4423-91ba-552d42b280dd"
  client_id       = "db6d1d0e-9246-4297-9e2a-cd9e5f7120e9"
  client_secret   = "c9c41253-efbb-4ca2-9a82-efc0d3882eaa"
  tenant_id       = "ce3685eb-9b4e-4652-a942-7ea5cda9e6c0"  
}

resource "azurerm_resource_group" "example" {
  name     = "satyam-github-demo"
  location = "East US"
}
