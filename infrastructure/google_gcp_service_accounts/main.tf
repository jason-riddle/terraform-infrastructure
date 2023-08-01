resource "google_service_account" "service_account" {
  count = var.enabled ? 1 : 0

  account_id   = "service-account-id"
  display_name = "Service Account"
}
