output "db_hostname" {
  value = google_sql_database_instance.database_instance.public_ip_address
}

output "db_instance_id" {
  value = google_sql_database_instance.database_instance.name
}

output "database_type" {
  value = var.database_version
}
