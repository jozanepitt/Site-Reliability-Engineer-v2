terraform {
  backend "s3" {
    bucket         = "mycompany-terraform-state"
    key            = "production/mycompany-api-infrastructure.tfstate"
    region         = var.aws_region
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
  }
}

