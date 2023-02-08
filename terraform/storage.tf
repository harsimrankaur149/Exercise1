resource "azurerm_resource_group" "practice" {
  name     = "practice"
  location = "West Europe"
  
}

resource "azurerm_storage_account" "practice_account_first" {
  name                     = "exercisestorageacc1"
  resource_group_name      = azurerm_resource_group.practice.name
  location                 = azurerm_resource_group.practice.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    name = "first-sa"
    environment = "staging"
  }
}

resource "azurerm_storage_account" "practice_account_second" {
  name                     = "exercisestorageacc2"
  resource_group_name      = azurerm_resource_group.practice.name
  location                 = azurerm_resource_group.practice.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on = [
    azurerm_storage_account.practice_account_first
  ]

  tags = {
    name = "second-sa"
    environment = "staging"
  }
}