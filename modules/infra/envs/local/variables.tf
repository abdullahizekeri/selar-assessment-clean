variable "aws_region" {
  description = "Not used for local, but keeps structure similar"
  type        = string
  default     = "us-east-1"
}

variable "kubeconfig_path" {
  description = "Path to kubeconfig"
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "Kube context name (minikube OR kind-<cluster-name>)"
  type        = string
  default     = "minikube"  # change to "kind-selar-kind" for Kind section
}

variable "image_repository" {
  description = "Local image repo/name"
  type        = string
  default     = "sample-api"
}

variable "image_tag" {
  description = "Local image tag"
  type        = string
  default     = "local"
}

variable "ingress_host" {
  description = "Local hostname"
  type        = string
  default     = "sample.local"
}

variable "ingress_class_name" {
  description = "Ingress class"
  type        = string
  default     = "nginx"
}
