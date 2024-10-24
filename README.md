# Site Reliability Engineer (SRE) v2

This project demonstrates the setup of a scalable, reliable infrastructure using AWS, Terraform, Kubernetes (EKS), and Docker with best practices in Site Reliability Engineering (SRE). The infrastructure is designed for high availability, fault tolerance, and automated monitoring.

## Key Features
- **Infrastructure as Code (IaC)** with Terraform
- **Kubernetes Cluster** with AWS EKS
- **PostgreSQL Database** with AWS RDS
- **Docker** for containerization
- **Monitoring** with Prometheus and Grafana
- **CI/CD** using GitHub Actions
- **Load Balancing** and **Autoscaling**

## What's Included
- AWS resources such as VPC, RDS, EKS, and IAM.
- Terraform modules to automate infrastructure setup.
- Monitoring setup with Prometheus and Grafana.
- Basic Kubernetes manifests for deploying applications.

## What's Missing
### 1. **Alertmanager Integration**: 
   - **Task**: Set up Alertmanager to integrate with Prometheus for alerting and configure routes to notify services like Slack.
   - **Solution**: Implement `alertmanager.yml` configuration and add `alert.rules.yml` in the repository. Configure Prometheus to route alerts to Alertmanager.

### 2. **CloudTrail Setup**: 
   - **Task**: Enable CloudTrail for AWS API logging.
   - **Solution**: Add Terraform resources for AWS CloudTrail and configure logging to an S3 bucket.

### 3. **Automated Testing with Terratest**: 
   - **Task**: Integrate infrastructure testing using Terratest.
   - **Solution**: Create Go tests for Terraform infrastructure and configure GitHub Actions to run these tests on every commit.

### 4. **Kubernetes Cluster Autoscaler**: 
   - **Task**: Enable Kubernetes Cluster Autoscaler for EKS.
   - **Solution**: Install the Cluster Autoscaler via Helm and configure EKS node groups for autoscaling.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/jozanepitt/Site-Reliability-Engineer-v2
   cd Site-Reliability-Engineer-v2
   ```

2. **Configure AWS CLI**:
   Ensure your AWS CLI is properly configured with sufficient permissions.

3. **Terraform**:
   Apply Terraform to set up infrastructure:
   ```bash
   terraform init
   terraform apply
   ```

4. **Kubernetes Setup**:
   Deploy applications and services to EKS using kubectl:
   ```bash
   kubectl apply -f kubernetes/
   ```

5. **CI/CD**:
   Configure GitHub Actions for CI/CD pipelines. Ensure all workflows are up to date and Terraform state management is set up properly.

## Monitoring and Alerts
- Access Grafana for visualizing metrics.
- Alertmanager will send alerts to the configured Slack channel once integrated.

## Roadmap
- [ ] Implement Alertmanager for better alert routing.
- [ ] Enable AWS CloudTrail for API logging.
- [ ] Add automated tests with Terratest.
- [ ] Configure EKS autoscaling with Cluster Autoscaler.

## Contributing
Feel free to open pull requests or issues for improvements or bug fixes. Contributions are welcome!

---

This README covers the project's current state, outlines missing features, and provides clear instructions for installation and contributions. You can adjust or expand this based on your specific needs.
