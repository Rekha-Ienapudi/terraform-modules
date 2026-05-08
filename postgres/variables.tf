variable "name" {
  type        = string
  description = "Name of the Postgres instance"
}

variable "engine_version" {
  type        = string
  default     = "16.1"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  default     = 20
}

variable "username" {
  type        = string
}

variable "password" {
  type        = string
  sensitive   = true
}

variable "database" {
  type        = string
}

variable "publicly_accessible" {
  type        = bool
  default     = false
}

variable "subnet_ids" {
  type        = list(string)
}

variable "security_group_ids" {
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
}
