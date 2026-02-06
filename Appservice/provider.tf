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