variable "scope" {}
variable "role" {}
variable "principal_id" {}

resource "azurerm_role_assignment" "ra" {
  scope                = var.scope
  role_definition_name = var.role
  principal_id         = var.principal_id
}
