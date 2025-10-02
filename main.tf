terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "harding-kevin-learntogrow-org"

    workspaces {
      name = "novatech-app-useast1-prod"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


# VPC Module
# -----------------------------
module "vpc" {
  source          = "./modules/vpc"
  name_prefix     = var.project_name
  project_name    = var.project_name
  region          = var.aws_region
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}


# EC2 Web Tier Module
# -----------------------------
module "ec2" {
  source            = "./modules/ec2"
  name_prefix       = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_pair_name     = var.key_pair_name
  admin_cidr        = var.admin_cidr
  user_data         = file("${path.module}/user_data.sh")
}


# RDS Database Module
# -----------------------------
module "rds" {
  source                = "./modules/rds"
  name_prefix           = var.project_name
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  web_security_group_id = module.ec2.web_security_group_id
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  allocated_storage     = var.allocated_storage
  engine_version        = var.engine_version
  instance_class        = var.db_instance_class
}


# Application Load Balancer Module
# -----------------------------
module "alb" {
  source                 = "./modules/alb"
  name_prefix            = var.project_name
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  instance_ids          = module.ec2.web_instance_ids
  web_security_group_id = module.ec2.web_security_group_id
}
