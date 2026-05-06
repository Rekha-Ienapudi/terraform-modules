variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tags" {
  type    = map(string)
  default = {}
}

resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  tags                = var.tags
  admin_enabled       = true
}

output "id"            { value = azurerm_container_registry.acr.id }
output "login_server"  { value = azurerm_container_registry.acr.login_server }
output "username"      { value = azurerm_container_registry.acr.admin_username }
output "password"      { value = azurerm_container_registry.acr.admin_password }
