resource "azurerm_resource_group" "rg" {
  name     = "cross-cloud-backup-rg"
  location = var.location
}
