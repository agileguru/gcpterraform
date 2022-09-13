variable "k8s_project" {
  type        = string
  description = "The Project of the GKE instance"
}

variable "k8s_iam_service_account_name" {
  type        = string
  description = "The IAM Service Account name GKE instance"
}
