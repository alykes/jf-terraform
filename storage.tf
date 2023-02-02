resource "azurerm_resource_group" "rg-jfrog" {
  name     = "rg.jfrog"
  location = "Australia East"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "jfrog-tfstate"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}