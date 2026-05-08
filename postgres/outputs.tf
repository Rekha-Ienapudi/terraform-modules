output "host" {
  value = aws_db_instance.this.address
}

output "port" {
  value = 5432
}

output "database" {
  value = var.database
}

output "username" {
  value = var.username
}

output "password" {
  value     = var.password
  sensitive = true
}

output "connection_url" {
  value     = local.connection_url
  sensitive = true
}

output "connection" {
  value = {
    host           = aws_db_instance.this.address
    port           = 5432
    database       = var.database
    username       = var.username
    password       = var.password
    connection_url = local.connection_url
  }
  sensitive = true
}
