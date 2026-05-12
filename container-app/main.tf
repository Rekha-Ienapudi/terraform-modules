variable "name" {}
variable "resource_group_name" {}
variable "environment_id" {}
variable "image" {}
variable "registry_server" {}
variable "registry_username" {}
variable "tags" {
  type    = map(string)
  default = {}
}

resource "azurerm_container_app" "app" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.environment_id
  tags                         = var.tags 

  revision_mode = "Single"

  identity {
    type = "SystemAssigned"
  }

  template {
    container {
      name  = "app"
      image = var.image

      resources {
        cpu    = 1.0
        memory = "2Gi"
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  registry {
    server   = var.registry_server
    username = var.registry_username
  }
}

output "principal_id" {
  value = azurerm_container_app.app.identity[0].principal_id
}
