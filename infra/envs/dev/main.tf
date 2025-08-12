terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.41.0"
    }
  }

  required_version = ">= 1.5.0"

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}

# Call VPC module
module "vpc" {
  source = "../../modules/vpc"
}

# Call EKS module
module "eks" {
  source          = "../../modules/eks"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

# Call ECR module
module "ecr" {
  source = "../../modules/ecr"
}
