variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
  default     = "novatech"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.10.3.0/24", "10.10.4.0/24"]
}

variable "ami_id" {
  description = "AMI ID for EC2 web servers"
  type        = string
  default     = "ami-0c94855ba95c71c99" 
}

variable "instance_type" {
  description = "Instance type for EC2 web servers"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
  default     = "kevinHarding_accesskeys"
}

variable "admin_cidr" {
  description = "CIDR allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0" # Change to your IP/CIDR for security
}

# RDS Variables
variable "db_name" {
  description = "Database name"
  type        = string
  default     = "novatechdb"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Database password (sensitive)"
  type        = string
  sensitive   = true
  default     = "StrongPassword123!" # Replace in Terraform Cloud for security
}

variable "allocated_storage" {
  description = "RDS storage size in GB"
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}
