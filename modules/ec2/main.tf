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

  # user_data script for Amazon Linux 2023
  user_data = <<-EOF
    #!/bin/bash
    # Update system packages
    sudo dnf update -y

    # Install NGINX
    sudo dnf install -y nginx

    # Enable and start NGINX
    sudo systemctl enable nginx
    sudo systemctl start nginx

    # Create a custom index.html page
    cat <<HTML > /usr/share/nginx/html/index.html
    <html>
      <head>
        <title>Welcome to NovaTech Solutions 🚀</title>
        <style>
          body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; padding: 50px; }
          h1 { color: #2c3e50; }
          p { font-size: 18px; color: #34495e; }
          h2 { margin-top: 40px; color: #2980b9; }
          ul { list-style: none; padding: 0; }
          li { margin: 8px 0; }
        </style>
      </head>
      <body>
        <h1>🚀 Welcome to NovaTech Solutions</h1>
        <p>Empowering the future with AI, Cloud, and Secure Infrastructure.</p>

        <h2>About Us</h2>
        <p>NovaTech Solutions pioneers advanced technologies in AI, cloud architecture, and zero-trust security frameworks. We’re building the bridge between human intelligence and machine potential.</p>

        <h2>Our Capabilities</h2>
        <ul>
          <li>🤖 AI Integration & Automation</li>
          <li>☁️ Cloud-Native & Edge Computing</li>
          <li>🔐 Zero Trust Security</li>
          <li>🧠 Quantum-Ready Software Development</li>
        </ul>

        <footer style="margin-top:40px; font-size:14px; color:#888;">
          &copy; 2025 NovaTech Solutions. All rights reserved.
        </footer>
      </body>
    </html>
    HTML

    # Restart NGINX to ensure the new page is served
    sudo systemctl restart nginx
  EOF

  tags = {
    Name = "${var.name_prefix}-web-${each.key + 1}"
  }
}

