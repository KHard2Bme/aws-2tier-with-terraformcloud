output "alb_arn" {
  description = "ALB ARN"
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.this.dns_name
}

output "alb_security_group_id" {
  description = "ALB security group id"
  value       = aws_security_group.alb_sg.id
}

output "target_group_arn" {
  description = "ALB target group arn"
  value       = aws_lb_target_group.web_tg.arn
}
