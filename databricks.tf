resource "azurerm_resource_group" "dev-dbks" {
  name     = "dev-dbks"
  location = "australiaeast"
}

resource "azurerm_databricks_workspace" "dev-dbks" {
  name                = "dev-databricks"
  resource_group_name = azurerm_resource_group.dev-dbks.name
  location            = azurerm_resource_group.dev-dbks.location
  sku                 = "standard"

  tags = local.common_tags
}
