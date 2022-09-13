provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "dev_db" {
  source               = "./db"
  database_project     = var.project
  database_region      = var.region
  db_tier              = "db-f1-micro"
  database_name        = var.db_dev_name
  db_user              = var.db_dev_user
  db_password          = var.db_dev_password
  allowed_network_cidr = "0.0.0.0/0"
}

module "dev_k8s" {
  source                         = "./k8s"
  k8s_project                    = var.project
  k8s_region                     = var.region
  k8s_cluster_location           = var.zone
  k8s_additional_node_zones      = ["us-central1-b"]
  k8s_vpc_name                   = "dev-k8s-vpc"
  k8s_tier                       = "e2-standard-2"
  k8s_spot_tier                  = "e2-standard-2"
  k8s_subnet_name                = "dev-k8s-subnet"
  k8s_subnet_cidr                = "10.0.0.0/18"
  k8s_pod_cidr                   = "10.48.0.0/14"
  k8s_pod_cidr_name              = "dev-k8s-pod-cidr"
  k8s_svc_cidr                   = "10.52.0.0/20"
  k8s_svc_cidr_name              = "dev-k8s-svc-cidr"
  k8s_cluster_name               = "dev-k8s-cluster"
  k8s_master_ipv4_cidr_block     = "172.16.0.0/28"
  k8s_service_account_name       = "dev-k8s-cluster-ser-ac"
  k8s_cluster_logging_service    = "logging.googleapis.com/kubernetes"
  k8s_cluster_monitoring_service = "monitoring.googleapis.com/kubernetes"
  k8s_tier_node_count            = 1
}

module "dev_k8s_service_accounts" {
  source                       = "./service-accounts"
  k8s_project                  = var.project
  k8s_iam_service_account_name = "dev-k8s-iam-ser-ac"
}

module "dev_nfs_share" {
  source          = "./storage"
  storage_name    = "dev-jenkins-nfs-storage"
  storage_project = var.project
  storage_zone    = var.zone
}
