variable "name_prefix" {
  description = "Name prefix"
  type        = string
  default     = "nova"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet ids for ALB"
  type        = list(string)
}

variable "instance_ids" {
  description = "List of instance ids to register with ALB target group"
  type        = list(string)
  default     = []
}

variable "web_security_group_id" {
  description = "Web SG id (to add ingress rule allowing ALB to reach web servers)"
  type        = string
}
