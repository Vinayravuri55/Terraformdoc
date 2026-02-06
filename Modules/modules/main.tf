data "azurerm resource group" "rg" {
  name = "813-5fbef1d6-hands-on-with-terraform-on-azure"
}

resource "azurerm storage account" "storage" {
  name                     = "${var.company}${var.environment}"
  location                 = data.azurerm_resource_group.rg.location
  resource_group_name      = data.azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}