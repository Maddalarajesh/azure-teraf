resource "azurerm_resource_group" "rg" {
  name = "azureresource"
  location = "East US"
}

# Create Storage Account with Static Website
resource "azurerm_storage_account" "static_website" {
  name = "azureblobraj1"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"  # Removed "_LRS"
  account_replication_type = "LRS" 
  static_website {
    index_document = "index.html"
    error_404_document = "404.html"
  }
}
