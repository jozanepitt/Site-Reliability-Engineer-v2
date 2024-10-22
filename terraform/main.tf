provider "aws" {
  region = var.aws_region
}

# Call VPC Module
module "vpc" {
  source = "./modules/vpc"
  # ... pass necessary variables
}

# Call EKS Module
module "eks" {
  source = "./modules/eks"
  # ... pass necessary variables
}

# Call RDS Module
module "rds" {
  source = "./modules/rds"
  # ... pass necessary variables
}

# Outputs
output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "kubeconfig" {
  value = module.eks.kubeconfig
  sensitive = true
}

