resource "google_service_account" "service-account" {
  account_id = var.k8s_iam_service_account_name
}

resource "google_project_iam_member" "service-account" {
  project = var.k8s_project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.service-account.email}"
}

resource "google_service_account_iam_member" "service-account" {
  service_account_id = google_service_account.service-account.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.k8s_project}.svc.id.goog[staging/${var.k8s_iam_service_account_name}]"
}
