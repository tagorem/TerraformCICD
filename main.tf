terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
    cloud {
    organization = "srikari"

    workspaces {
      name = "TerraformCI"
    }
  }
}
provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rgdemo" {
  name     = "1-d3dcd877-playground-sandbox"
  location = "South Central US"

}

resource "azurerm_storage_account" "sgStorage" {
  name                     = "cgteststorage"
  resource_group_name      = azurerm_resource_group.rgdemo.name
  location                 = azurerm_resource_group.rgdemo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

