# IAM Policy Troubleshooter: https://console.cloud.google.com/iam-admin/troubleshooter

# Requires: iam.googleapis.com
# https://console.developers.google.com/apis/api/iam.googleapis.com/overview?project=425848421470
#
# RESOURCE: https://console.cloud.google.com/iam-admin/serviceaccounts/details/100976711803280994849?project=starlit-factor-394405
resource "google_service_account" "service_account" {
  count = var.enabled ? 1 : 0

  account_id   = "service-account-id"
  display_name = "Service Account"
}

data "google_iam_policy" "policy" {
  binding {
    role = "roles/iam.serviceAccountUser"

    members = [
      "group:engineering@hmm.com"
    ]
  }
}

resource "google_service_account_iam_policy" "policy" {
  service_account_id = google_service_account.service_account[0].id
  policy_data        = data.google_iam_policy.policy.policy_data
}

resource "google_project_iam_member" "binding" {
  role   = "roles/aiplatform.admin"
  member = data.google_service_account.service_account[0].member
}
