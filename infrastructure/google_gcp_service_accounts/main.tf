# IAM Policy Troubleshooter: https://console.cloud.google.com/iam-admin/troubleshooter

# Requires: iam.googleapis.com
# https://console.developers.google.com/apis/api/iam.googleapis.com/overview?project=425848421470
resource "google_service_account" "service_account" {
  count = var.enabled ? 1 : 0

  account_id   = "service-account-id"
  display_name = "Service Account"
}
