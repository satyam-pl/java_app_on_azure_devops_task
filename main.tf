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
  client_id       = "eeceac2a-308b-4295-a715-08f24fe03707"
  client_secret   = "4e0ded0a-7bf4-4747-ab51-f5ce73776b6e"
  tenant_id       = "ce3685eb-9b4e-4652-a942-7ea5cda9e6c0"

  version = "=2.0"
}

resource "azurerm_resource_group" "example" {
  name     = "satyam-github-demo"
  location = "East US"
}
