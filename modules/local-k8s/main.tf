terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.30.0"
    }
  }
}

resource "kubernetes_namespace" "ns" {
  metadata {
    name = var.namespace
  }
}

# Render a values.yaml from template so we can easily pass nested values
locals {
  rendered_values = templatefile("${path.module}/values.tmpl.yaml", {
    image_repo   = var.image_repository
    image_tag    = var.image_tag
    ingress_host = var.ingress_host
    ingress_class = var.ingress_class_name
  })
}

resource "helm_release" "sample_api" {
  name       = var.release_name
  namespace  = var.namespace
  chart      = var.chart_path           # local path to your chart dir
  wait       = true
  atomic     = true
  cleanup_on_fail = true
  dependency_update = true

  values = [local.rendered_values]

  depends_on = [kubernetes_namespace.ns]
}

output "release_name" {
  value = helm_release.sample_api.name
}
