variable "chart_path" {
  description = "Absolute path to the Helm chart directory"
  type        = string
}

variable "release_name" {
  description = "Helm release name"
  type        = string
  default     = "sample-api"
}

variable "namespace" {
  description = "Kubernetes namespace to deploy into"
  type        = string
  default     = "apps"
}

variable "image_repository" {
  description = "Image repo (for local runs, use local image name)"
  type        = string
  default     = "sample-api"
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "local"
}

variable "ingress_host" {
  description = "Hostname for local ingress"
  type        = string
  default     = "sample.local"
}

variable "ingress_class_name" {
  description = "Ingress class name (nginx for Minikube/Kind with ingress-nginx)"
  type        = string
  default     = "nginx"
}
