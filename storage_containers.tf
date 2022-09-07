resource "azurerm_resource_group" "storage-rg" {
  name     = "dev-storage"
  location = var.azure_region
  tags     = local.common_tags
}

resource "azurerm_storage_account" "storage-rg" {
  name                     = "springfielddevdatalake"
  resource_group_name      = azurerm_resource_group.storage-rg.name
  location                 = azurerm_resource_group.storage-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage-rg" {
  name                  = "raw"
  storage_account_name  = azurerm_storage_account.storage-rg.name
  container_access_type = "private"
}

