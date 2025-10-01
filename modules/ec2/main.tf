# Web security group - allows SSH from admin CIDR. HTTP inbound from ALB will be added by alb module (security group rule).
resource "aws_security_group" "web_sg" {
  name        = "${var.name_prefix}-web-sg"
  description = "Web servers SG (SSH from admin; HTTP allowed from ALB via separate rule)"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  # no HTTP ingress here — ALB module will create a SG rule that allows ALB SG to reach this SG on port 80

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-web-sg"
  }
}

# EC2 instances - one in each provided public subnet
resource "aws_instance" "web" {
  for_each = { for idx, id in var.public_subnet_ids : idx => id }

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = each.value
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = var.user_data

  tags = {
    Name = "${var.name_prefix}-web-${each.key + 1}"
  }
}
