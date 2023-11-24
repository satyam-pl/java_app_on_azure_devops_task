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

resource "azurerm_app_service" "example_webapp" {
  name                = "my-java-app"  # Specify your Azure Web App name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id  = azurerm_app_service_plan.example.id

  site_config {
    java_version = "1.8"  # Specify the Java version
    java_container = "TOMCAT"  # Specify the Java container
  }
}

resource "azurerm_app_service_plan" "example" {
  name                = "my-app-service-plan"  # Specify your App Service Plan name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
