variable "project" {
  default     = "guru-playground"
  description = "The project ID"
}

variable "region" {
  default     = "us-central1"
  description = "The region where this infra will be created"
}

variable "zone" {
  default     = "us-central1-a"
  description = "The Default Availability Zone where this infra will be created"
}

variable "db_dev_name" {
  default     = "dev"
  description = "The name for dev database"
}

variable "db_dev_user" {
  default     = "devdbadmin"
  description = "The User for dev database"
}


variable "db_dev_password" {
  default     = "9A2AB04E-A051-"
  description = "The Password for dev database"
}


