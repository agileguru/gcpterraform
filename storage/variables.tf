variable "storage_name" {
  type        = string
  description = "The name of the storage"
}

variable "storage_project" {
  type        = string
  description = "The Project of the storage instance"
}

variable "storage_zone" {
  type        = string
  description = "The Region of the storage instance"
}

variable "storage_tier" {
  default     = "pd-standard"
  description = "The instance tiers"
}

variable "storage_capacity_gb" {
  type    = number
  default = 100
}

