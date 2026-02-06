# Create a resource group in Azure
resource "azurerm_resource_group" "rg" {
  name     = "resourcegroupname1"
  location = "West US"
}

# Create multiple storage accounts using count in Azure
resource "azurerm_storage_account" "storage" {
  count                    = 4
  name                     = "stgstkiran${count.index}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}