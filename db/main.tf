resource "random_id" "db_instance_id" {
  byte_length = 12
}

resource "google_sql_database_instance" "database_instance" {
  name                = "${var.database_project}-${var.database_name}-${random_id.db_instance_id.hex}"
  project             = var.database_project
  region              = var.database_region
  database_version    = var.database_version
  deletion_protection = true
  settings {
    tier = var.db_tier
    ip_configuration {
      authorized_networks {
        name  = "allowed_network_cidr"
        value = var.allowed_network_cidr
      }
    }
  }

}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.database_instance.name
  project  = var.database_project
  depends_on = [
    google_sql_database_instance.database_instance
  ]
}


resource "google_sql_user" "users" {
  name     = var.db_user
  instance = google_sql_database_instance.database_instance.name
  project  = var.database_project
  password = var.db_password
  host     = "%"
  depends_on = [
    google_sql_database.database
  ]
}
