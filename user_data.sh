#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
echo "<h1>Welcome to NovaTech Solutions 🚀</h1>" > /var/www/html/index.html
echo "<p>Let's build next-gen solutions together!!</p>" >> /var/www/html/index.html
