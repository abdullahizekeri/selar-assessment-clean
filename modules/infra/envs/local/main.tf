terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.30.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "kubernetes" {
  config_path    = var.kubeconfig_path
  config_context = var.kube_context
}

provider "helm" {
  kubernetes {
    config_path    = var.kubeconfig_path
    config_context = var.kube_context
  }
}

module "local_k8s" {
  source = "../../modules/local-k8s"

  chart_path        = "${path.root}/../../deploy/helm/sample-api"
  release_name      = "sample-api"
  namespace         = "apps"
  image_repository  = var.image_repository
  image_tag         = var.image_tag
  ingress_host      = var.ingress_host
  ingress_class_name= var.ingress_class_name
}
