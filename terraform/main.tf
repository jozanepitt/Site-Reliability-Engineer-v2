provider "aws" {
  region = var.aws_region
}

# Backend configuration
terraform {
  backend "s3" {
    bucket         = "mycompany-terraform-state"
    key            = "production/mycompany-api-infrastructure.tfstate"
    region         = var.aws_region
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  vpc_name          = "mycompany-production-vpc"
  cidr_block        = "10.0.0.0/16"
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones = ["us-west-2a", "us-west-2b"]

  tags = {
    Environment = var.environment
    Project     = "MyCompanyAPI"
  }
}

# EKS Module
module "eks" {
  source = "./modules/eks"

  cluster_name    = "mycompany-prod-eks-cluster"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  public_subnet_ids = module.vpc.public_subnet_ids
  node_group_name = "mycompany-prod-node-group"

  node_instance_type = "t3.medium"
  desired_capacity   = 3
  max_capacity       = 5
  min_capacity       = 2

  tags = {
    Environment = var.environment
    Project     = "MyCompanyAPI"
  }
}

# RDS Module
module "rds" {
  source = "./modules/rds"

  db_identifier   = "mycompany-prod-db"
  engine          = "postgres"
  engine_version  = "13.4"
  instance_class  = "db.t3.medium"
  allocated_storage = 20
  username        = var.db_username
  password        = var.db_password
  vpc_security_group_ids = [module.vpc.private_security_group_id]
  subnet_ids      = module.vpc.private_subnet_ids

  tags = {
    Environment = var.environment
    Project     = "MyCompanyAPI"
  }
}

# Outputs
output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "kubeconfig" {
  value     = module.eks.kubeconfig
  sensitive = true
}
