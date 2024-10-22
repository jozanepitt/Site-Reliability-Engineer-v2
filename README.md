# MyCompany API Infrastructure

A comprehensive infrastructure setup for deploying the **MyCompany API** application using Terraform, Docker, and Kubernetes on AWS EKS. This repository demonstrates best practices in infrastructure as code (IaC), containerization, orchestration, and CI/CD pipelines.

---

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [Terraform Setup](#terraform-setup)
  - [Docker Image Build](#docker-image-build)
  - [Kubernetes Deployment](#kubernetes-deployment)
- [Observability](#observability)
- [CI/CD Pipeline](#cicd-pipeline)
- [Security Considerations](#security-considerations)
- [Testing](#testing)
- [Contribution Guidelines](#contribution-guidelines)
- [License](#license)
- [Acknowledgments](#acknowledgments)

---

## Architecture Overview

![Architecture Diagram](docs/architecture-diagram.png)

**Components:**

- **AWS VPC (`mycompany-production-vpc`):** Custom VPC with public and private subnets across two availability zones for high availability.
- **AWS EKS Cluster (`mycompany-prod-eks-cluster`):** Managed Kubernetes cluster for deploying containerized applications.
- **AWS RDS PostgreSQL Instance (`mycompany-prod-db`):** Relational database service for application data storage.
- **CI/CD Pipeline:** Automated build and deployment pipeline using GitHub Actions.
- **Observability Stack:** Monitoring and logging using Prometheus, Grafana, and AWS CloudWatch.

---

## Prerequisites

- **AWS Account** with permissions to create VPCs, EKS clusters, RDS instances, and other resources.
- **AWS CLI** configured with your AWS credentials.
- **Terraform** v1.0 or later.
- **Docker** installed and running.
- **kubectl** installed and configured.
- **Helm** package manager for Kubernetes.
- **Python** 3.9 or later.
- **Git** for version control.

---

## Setup Instructions

### Terraform Setup

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/mycompany-api-infrastructure.git
   cd mycompany-api-infrastructure/terraform/
