terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# Google
#
# URLs:
# - Docs: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
# - Create a new service account: https://cloud.google.com/iam/docs/service-accounts-create
#
# Export:
# - `GOOGLE_CREDENTIALS`
#
# Service Account Credentials
# - Name: tf-test-account
# - Permissions: Owner, Service Account User
# - Permissions URL: https://console.cloud.google.com/iam-admin/serviceaccounts/details/112222367733525882864/permissions?project=starlit-factor-394405
# - Keys: https://console.cloud.google.com/iam-admin/serviceaccounts/details/112222367733525882864/keys?project=starlit-factor-394405
provider "google" {
  project = "starlit-factor-394405"
}
