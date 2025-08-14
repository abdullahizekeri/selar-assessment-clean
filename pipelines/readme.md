How it works

Pull Request → main
→ Runs terraform validate & plan (no changes applied).

Merge → main
→ Waits for approval in production environment.
→ Applies Terraform changes.
→ Builds & pushes Docker image to ECR.
→ Deploys to EKS with Helm.