variable "name" {}
variable "location" {}
variable "tags" {
  type    = map(string)
  default = {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags     = var.tags
}


output "id" {
  value = azurerm_resource_group.rg.id
}

output "name" {
  value = azurerm_resource_group.rg.name
}
