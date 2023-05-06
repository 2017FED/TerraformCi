# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.43.0"
    }
  }
  cloud {
    organization = "ParminderSaini"

    workspaces {
      name = "TerraformCi"
    }
  }
}


provider "azurerm" {
  features {
  }
  skip_provider_registration = true
}


resource "random_string" "uniquestring" {
  length  = 20
  special = false
  upper   = false
}


resource "azurerm_resource_group" "rg" {
  name     = "811-c6273659-provide-continuous-delivery-with-gith"
  location = "southcentralus"
}


resource "azurerm_storage_account" "storageaccount" {
  name                     = "stg${random_string.uniquestring.result}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

