variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  default     = "us-west-2"
}

variable "environment" {
  description = "Deployment environment"
  default     = "production"
}

variable "db_username" {
  description = "Database master username"
}

variable "db_password" {
  description = "Database master password"
  sensitive   = true
}

# ... other variables as needed
