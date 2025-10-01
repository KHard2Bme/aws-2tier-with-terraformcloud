# 🚀 Two-Tier AWS Architecture with Terraform & Terraform Cloud  

![Terraform](https://img.shields.io/badge/Terraform-IaC-blue?style=flat-square)  
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=flat-square)  
![CI/CD](https://img.shields.io/badge/CI%2FCD-Automation-success?style=flat-square)  

## 📖 Project Overview  

This project demonstrates how to **deploy a highly available, secure, and scalable two-tier AWS architecture** using **Terraform** and **Terraform Cloud** for CI/CD automation. The infrastructure is fully automated, modular, and built to scale with future workloads.  

It provisions:  
- ☁️ A **Custom VPC** with public and private subnets  
- 🖥️ **EC2 web servers (NGINX)** deployed in public subnets  
- 🗄️ **RDS MySQL database** deployed in private subnets  
- 🛡️ **Security Groups** following least-privilege best practices  
- 🌐 An **Application Load Balancer (ALB)** for high availability  
- 🔄 **Terraform Cloud CI/CD** pipeline with GitHub integration  
- 🧩 **Custom modules** for repeatable deployments  

---

## 🎯 Project Objectives  

- ✅ Deploy a secure, highly available two-tier architecture in AWS  
- ✅ Automate infrastructure provisioning with Terraform  
- ✅ Use Terraform Cloud as a CI/CD tool with GitHub integration  
- ✅ Leverage modular Terraform code for reusability and scalability  
- ✅ Implement best security practices with isolated tiers and SGs  

---

## 📂 Project Structure  

```
aws-2tier-with-terraformcloud/
├── main.tf
├── variables.tf
├── outputs.tf
├── user_data.sh
├── modules/
│   ├── vpc/main.tf
            variables.tf
            outputs.tf
│   ├── ec2/main.tf
            variables.tf
            outputs.tf
│   ├── rds/main.tf
            variables.tf
            outputs.tf
│   └── alb/main.tf
            variables.tf
            outputs.tf
└── README.md
```

---
## 🧑‍💻 Prerequisites  

Before you begin, make sure you have:  
- 🔑 AWS account and IAM user with required permissions  
- 💻 Terraform CLI installed (`>=1.5`)  
- ☁️ Terraform Cloud account  
- 🐙 GitHub repository linked to your Terraform Cloud workspace  

---

## ⚙️ Deployment Steps  

### 1️⃣ Clone the Repository  

```bash
git clone https://github.com/KHard2Bme/aws-2tier-with-terraformcloud.git
cd aws-2tier-with-terraformcloud
```

### 2️⃣ Configure Environment Variables in Terraform Cloud  

In your Terraform Cloud workspace, set the following **environment variables**:  
- `AWS_ACCESS_KEY_ID`  
- `AWS_SECRET_ACCESS_KEY`  
- `AWS_DEFAULT_REGION`  

⚠️ Make sure these are marked as **sensitive**.

### 3️⃣ Initialize and Validate Terraform  

```bash
terraform init
terraform validate
```

### 4️⃣ Plan and Apply the Infrastructure  

```bash
terraform plan
terraform apply
```

### 5️⃣ Access the Web Application  

Once deployed, Terraform will output the **ALB DNS Name**. Open it in your browser to view your deployed NGINX web page 🌐.

---

## 📁 Features  

- 🛠️ **Infrastructure as Code:** Repeatable deployments using Terraform  
- 🧩 **Modular Design:** Clean and maintainable codebase  
- 🚀 **CI/CD Automation:** Auto-deploy infrastructure via Terraform Cloud + GitHub  
- 🔐 **Security Best Practices:** Isolated tiers and least-privilege access  
- 🌍 **Highly Available:** Multi-AZ deployment with ALB load balancing  

---

## 🧠 Key Learnings  

- 📜 How to use **Terraform** to provision real-world AWS infrastructure  
- 🏗️ Best practices for **VPC, subnetting, and security group design**  
- 🔁 Automating infrastructure with **Terraform Cloud CI/CD**  
- 🧰 Building reusable **Terraform modules** for scalable environments  
