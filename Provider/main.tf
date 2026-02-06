terraform {
  required_version = ">= 1.0" # Terraform version

  # Specify the required providers
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
}

# Configure the AzureRM provider
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  tenant_id                       = "XXXXXXxx-xxxx-xxxx-xxxx-XXXXXXXXXXXX"     # Tenant ID
  subscription_id                 = "xxxxxxxx-xxxx-xxxx-xxXX-XXXXXXXXXXXx"     # Subscription ID
  client_id                       = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXxx"     # Service principle Id
  client_secret                   = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxx" # Service principle secret
}

# Create a resource group in Azure
resource "azurerm_resource_group" "rg" {
  name     = "resourcegroupname1"
  location = "West US"
}

# create a storage account in Azures
resource "azurerm_storage_account" "storage" {
  name                     = "storageaccountname1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
