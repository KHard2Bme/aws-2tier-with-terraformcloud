variable "name_prefix" {
  description = "Resource name prefix"
  type        = string
  default     = "nova"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet ids for RDS"
  type        = list(string)
}

variable "web_security_group_id" {
  description = "Web servers security group id (to allow DB access)"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "novatechdb"
}

variable "db_username" {
  description = "Database admin username"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}
