# VPC Outputs
output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

# EC2 Outputs
output "web_instance_public_ips" {
  description = "Public IP addresses of web servers"
  value       = module.ec2.web_instance_public_ips
}

# RDS Outputs
output "db_endpoint" {
  description = "RDS MySQL endpoint"
  value       = module.rds.db_endpoint
}

# ALB Outputs
output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = module.alb.alb_dns_name
}
