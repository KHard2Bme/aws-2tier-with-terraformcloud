output "db_instance_id" {
  description = "RDS instance id"
  value       = aws_db_instance.mysql.id
}

output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.mysql.endpoint
}

output "rds_security_group_id" {
  description = "RDS security group id"
  value       = aws_security_group.rds_sg.id
}
