module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.17.0"

  cluster_name    = "selar-eks"
  cluster_version = "1.29"

  subnet_ids = var.private_subnets
  vpc_id     = var.vpc_id
  
  fargate_profiles = {}  # Explicitly disable Fargate profiles

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
    }
  }
}