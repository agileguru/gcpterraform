resource "google_compute_disk" "instance" {
  name = var.storage_name
  zone = var.storage_zone
  type = var.storage_tier
  size = var.storage_capacity_gb

}
