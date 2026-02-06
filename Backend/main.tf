terraform {
  required_version = ">= 1.0" # Terraform version

  # Specify the required providers
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }

  # Configure Azure backend
  backend "azurerm" {
    resource_group_name  = "resourcegroupname1"  # Name of the resource group where the storage account is located
    storage_account_name = "storageaccountname1" # Name of the storage account
    container_name       = "containername99"     # Name of the container in the storage account
    key                  = "terraform.tfstate"   #blob file name
    access_key           = "containeraccesskey"  # Access key for the storage account
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

# create a container
resource "azurerm_storage_container" "contaonename9" {
  name               = "containername99"
  storage_account_id = azurerm_storage_account.storage.id
}
