#!/bin/bash
# Update and install NGINX
apt update -y
apt install -y nginx

# Enable and start NGINX
systemctl enable nginx
systemctl start nginx

# Create a custom index.html page
cat <<EOT > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to NovaTech Solutions</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      color: #ffffff;
      margin: 0;
      padding: 0;
    }
    header {
      background-color: rgba(0,0,0,0.7);
      padding: 20px;
      text-align: center;
    }
    header h1 {
      margin: 0;
      font-size: 2.5em;
    }
    nav {
      margin-top: 10px;
    }
    nav a {
      color: #00d1b2;
      margin: 0 15px;
      text-decoration: none;
      font-weight: bold;
    }
    nav a:hover {
      text-decoration: underline;
    }
    section {
      padding: 50px;
      max-width: 800px;
      margin: auto;
      text-align: center;
    }
    h2 {
      color: #00d1b2;
      font-size: 2em;
      margin-bottom: 20px;
    }
    p {
      font-size: 1.2em;
      line-height: 1.6;
    }
    ul {
      list-style-type: none;
      padding: 0;
      font-size: 1.2em;
    }
    ul li {
      margin: 10px 0;
    }
    footer {
      background-color: rgba(0,0,0,0.8);
      text-align: center;
      padding: 15px;
      position: fixed;
      bottom: 0;
      width: 100%;
      font-size: 0.9em;
    }
  </style>
</head>
<body>

<header>
  <h1>🚀 Welcome to NovaTech Solutions</h1>
  <nav>
    <a href="#home">Home</a>
    <a href="#about">About</a>
    <a href="#capabilities">Capabilities</a>
  </nav>
</header>

<section id="home">
  <h2>Home</h2>
  <p>Your two-tier AWS architecture is up and running — deployed with Terraform, secured by best practices, and built for the future. Explore our mission and capabilities below.</p>
</section>

<section id="about">
  <h2>About Us</h2>
  <p>At NovaTech Solutions, we pioneer advanced technologies that bridge the gap between humans and machines. Our mission is to design secure, scalable, and intelligent systems that drive innovation and transform the way organizations operate in the digital era.</p>
</section>

<section id="capabilities">
  <h2>Our Capabilities</h2>
  <ul>
    <li>💻 Quantum-Ready Software Development</li>
    <li>☁️ Cloud-Native & Edge Computing Solutions</li>
    <li>🔐 Zero Trust Security Frameworks</li>
    <li>🤖 AI Integration & Process Automation</li>
  </ul>
</section>

<footer>
  &copy; 2025 NovaTech Solutions — Innovating the Future of Human-Machine Synergy
</footer>

</body>
</html>
EOT

# Restart NGINX to load the new page
systemctl restart nginx

