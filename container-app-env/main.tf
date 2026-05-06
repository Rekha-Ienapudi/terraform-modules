variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tags" {
  type    = map(string)
  default = {}
}

resource "azurerm_container_app_environment" "cae" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = var.tags
}


output "id" {
  value = azurerm_container_app_environment.cae.id
}
