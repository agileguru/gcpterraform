variable "database_version" {
  default     = "POSTGRES_13"
  description = "The database and its version. Please note that only postgres is supported by the application"
}

variable "database_name" {
  type        = string
  description = "The name of the database"
}

variable "database_project" {
  type        = string
  description = "The Project of the database instance"
}

variable "database_region" {
  default     = "us-central1"
  description = "The Region of the database instance"
}

variable "db_tier" {
  default     = "db-f1-micro"
  description = "The instance tiers are based on the machine"
}

variable "db_password" {
  type        = string
  description = "The database password"
}

variable "db_user" {
  type        = string
  description = "The database user"
}

variable "allowed_network_cidr" {
  type        = string
  description = "CIDR Range to allow access"
}
