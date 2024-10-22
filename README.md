# MyCompany API Infrastructure

A comprehensive infrastructure setup for deploying the **MyCompany API** application using Terraform, Docker, and Kubernetes on AWS EKS. This repository demonstrates best practices in infrastructure as code (IaC), containerization, orchestration, and CI/CD pipelines.

---

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Application Development (`app/`)](#2-application-development-app)
  - [3. Terraform Configuration (`terraform/`)](#3-terraform-configuration-terraform)
  - [4. Kubernetes Manifests (`kubernetes/`)](#4-kubernetes-manifests-kubernetes)
  - [5. CI/CD Pipeline (`.github/workflows/ci-cd.yml`)](#5-cicd-pipeline-githubworkflowsci-cdyml)
- [Observability](#observability)
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

## Project Structure

