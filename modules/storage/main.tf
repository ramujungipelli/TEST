resource "azurerm_storage_account" "genesis_storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "genesis_container" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}