***Slide 1 – High-Level Overview**

“This architecture implements a cloud-native application on AWS EKS with a CI/CD pipeline, observability stack, and local development parity.”

Key points to highlight:

Cloud: AWS EKS, ECR, VPC, CloudWatch, Prometheus/Grafana.

Local: Minikube/Kind with same deployment patterns via Terraform.

CI/CD: GitHub Actions for automation.

Networking: NGINX/Treafik ingress with TLS and security controls.

***Slide 2 – CI/CD Workflow**

“The pipeline ensures every code change is validated, planned, and deployed safely.”

Explain:

Developer pushes code → GitHub Actions triggers.

Terraform Validate & Plan on PRs (no changes applied).

On merge to main → Terraform Apply after approval gate.

Builds Docker image → pushes to ECR.

Helm deploys new image to EKS.

***Slide 3 – AWS Infrastructure**

“The infrastructure runs inside a secure VPC.”

Highlight:

EKS Cluster with managed node groups.

Ingress Controller handling HTTPS and routing.

Pods running the Sample API.

Amazon ECR storing images.

Private subnets for workloads, public subnets only for load balancers.

***Slide 4 – Networking & Security**

“Ingress is configured with TLS and security best practices.”

Controls:

Host-based routing (sample.selar.co).

TLS termination with ACM certificate.

Rate limiting & IP whitelisting.

Resource quotas and network policies (deny-all default, allow only needed namespaces).

***Slide 5 – Observability**

“We have full visibility into the system’s health.”

Tools:

CloudWatch Logs for cluster and app logs.

Prometheus for metrics collection.

Grafana dashboards for visualization.

Alertmanager to send alerts to Slack/Email.

***Slide 6 – Incident Response**

“We detect issues quickly and recover fast.”

Example incident flow:

Alert on high error rate from Prometheus.

Check logs in CloudWatch.

Investigate metrics in Grafana.

Roll back last deployment if needed (helm rollback).

Document RCA and push a fix.

***Slide 7 – Local Parity**

“Developers can test locally with the same patterns as production.”

Local Minikube/Kind cluster.

Local Terraform module local-k8s for deploying Helm chart.

Local image builds (minikube image load).

Same Helm values structure.