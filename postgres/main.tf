resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids
  tags       = var.tags
}

resource "aws_db_instance" "this" {
  identifier              = var.name
  engine                  = "postgres"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage

  username                = var.username
  password                = var.password
  db_name                 = var.database
  port                    = 5432

  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = var.security_group_ids

  publicly_accessible     = var.publicly_accessible
  skip_final_snapshot     = true

  tags = var.tags
}

locals {
  connection_url = "postgresql://${var.username}:${urlencode(var.password)}@${aws_db_instance.this.address}:5432/${var.database}"
}
