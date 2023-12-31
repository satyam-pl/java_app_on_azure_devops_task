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
      name = "gh-actions-demo-java"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "fafa58df-5f3a-4423-91ba-552d42b280dd"
  client_id       = "e12a2d0e-c7a8-497a-9c6a-f6feb27b10ac"
  client_secret   = "~Ik8Q~u1dpSqwite8M6b-y4doLRhIEZPVpcmFcx4"
  tenant_id       = "ce3685eb-9b4e-4652-a942-7ea5cda9e6c0"
}

resource "azurerm_resource_group" "example" {
  name     = "satyam-github-demo"
  location = "East US"
}
