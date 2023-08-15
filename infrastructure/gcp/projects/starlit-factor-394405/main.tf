resource "google_service_account" "service_account" {
  account_id   = "service-account-example-id"
  display_name = "Service Account Example Name"
}

resource "time_rotating" "rotation" {
  rotation_days = 30
}

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.service_account.name

  keepers = {
    rotation_time = time_rotating.rotation.rotation_rfc3339
  }
}
