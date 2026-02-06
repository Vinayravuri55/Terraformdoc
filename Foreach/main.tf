# Create a resource group in Azure
resource "azurerm_resource_group" "rg" {
  name     = "resourcegroupname1"
  location = "West US"
}

#create multiple storage account in Azure using for each 
resource "azurerm_storage_account" "storage" {
  for_each                 = toset(var.storage_names)
  name                     = each.value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}