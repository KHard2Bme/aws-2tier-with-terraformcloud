variable "name_prefix" {
  description = "Name prefix for resources"
  type        = string
  default     = "nova"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet ids where web instances will be launched (2 expected)"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI for EC2 instances"
  type        = string
  default     = "ami-0c94855ba95c71c99" 
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "admin_cidr" {
  description = "CIDR that can SSH to instances (your admin IP or CIDR)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "user_data" {
  description = "User data script to provision web server"
  type        = string
  default     = ""
}
