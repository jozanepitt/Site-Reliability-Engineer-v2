MyCompany API Infrastructure
A comprehensive infrastructure setup for deploying the MyCompany API application using Terraform, Docker, and Kubernetes on AWS EKS.

b. Architecture Overview
<!-- Include a diagram in the docs folder -->

Architecture Components:

AWS VPC (mycompany-production-vpc):
Custom VPC with public and private subnets across two availability zones.
AWS EKS Cluster (mycompany-prod-eks-cluster):
Managed Kubernetes cluster for container orchestration.
AWS RDS PostgreSQL Instance (mycompany-prod-db):
Relational database for application data storage.
CI/CD Pipeline:
Automated builds and deployments using GitHub Actions.
c. Prerequisites
AWS Account with appropriate permissions.
Terraform v1.0 or later.
AWS CLI configured with credentials.
kubectl for interacting with Kubernetes clusters.
Docker for building container images.
Python 3.9 or later.
d. Setup Instructions
Terraform Setup
Configure AWS Credentials:

Ensure your AWS CLI is configured with the necessary permissions.

Initialize Terraform:

bash
Copy code
cd terraform/
terraform init
Create a terraform.tfvars File:

Create a terraform.tfvars file to provide variable values (do not commit this file):

hcl
Copy code
aws_region = "us-west-2"
environment = "production"
db_username = "mycompany_db_user"
db_password = "securepassword123"
Plan Infrastructure:

bash
Copy code
terraform plan -out=tfplan
Apply Infrastructure:

bash
Copy code
terraform apply tfplan
Docker Image Build
Build Docker Image:

bash
Copy code
cd app/
docker build -t mycompanyregistry/mycompany-api:1.0.0 .
Push Docker Image:

bash
Copy code
docker login -u your-username -p your-password
docker push mycompanyregistry/mycompany-api:1.0.0
Kubernetes Deployment
Update kubeconfig:

bash
Copy code
aws eks update-kubeconfig --name mycompany-prod-eks-cluster --region us-west-2
Deploy Manifests:

bash
Copy code
cd kubernetes/
kubectl apply -f .
e. Observability
Monitoring:

Deploy Prometheus and Grafana using the Prometheus Community Helm Chart.

bash
Copy code
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install mycompany-monitoring prometheus-community/kube-prometheus-stack
Access Grafana and import dashboards for Kubernetes and application metrics.

Logging:

Use AWS CloudWatch Logs for centralized logging.
Configure Fluentd or Fluent Bit as a DaemonSet to forward logs to CloudWatch.
f. CI/CD Pipeline
Pipeline Overview:
Build and Test:
On every push to main, the pipeline builds the Docker image and runs unit tests.
Deploy:
After a successful build, the new image is deployed to the EKS cluster.
Versioning:
Docker images are tagged with the Git commit SHA for traceability.
g. Security Considerations
IAM Roles and Policies:

Use IAM roles for service accounts (IRSA) to grant Kubernetes pods access to AWS services securely.
Follow the principle of least privilege for all IAM roles.
Secrets Management:

Use AWS Secrets Manager to store sensitive information.
Integrate with Kubernetes using the External Secrets Operator.
Network Security:

Utilize Security Groups and Network ACLs to control traffic.
Implement Kubernetes Network Policies to restrict pod-to-pod communication.
h. Testing
Application Tests:

bash
Copy code
cd app/
python -m unittest discover tests
Infrastructure Validation:

Use terraform validate to check the Terraform configuration.
Use kubectl apply --dry-run=client -f kubernetes/ to validate Kubernetes manifests.
i. Contribution Guidelines
Branching Strategy:

Use feature branches for new features and bug fixes.
Submit Pull Requests for code reviews.
Commit Messages:

Follow the Conventional Commits specification.
Issue Tracking:

Use GitHub Issues to track bugs and feature requests.
