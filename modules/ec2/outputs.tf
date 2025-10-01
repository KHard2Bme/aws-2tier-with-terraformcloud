output "web_instance_ids" {
  description = "IDs of web EC2 instances"
  value       = [for i in aws_instance.web : i.id]
}

output "web_instance_public_ips" {
  description = "Public IPs of web instances"
  value       = [for i in aws_instance.web : i.public_ip]
}

output "web_security_group_id" {
  description = "Security Group ID for web servers"
  value       = aws_security_group.web_sg.id
}
