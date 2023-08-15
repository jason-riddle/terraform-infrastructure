terraform {
  required_version = ">= 1.0.0"

  cloud {
    organization = "org-jasonriddle"

    workspaces {
      name = "terraform-infrastructure"
    }
  }

  required_providers {
    # Docs:
    # - https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
    cloudflare = {
      source = "cloudflare/cloudflare"
    }

    # Docs:
    # - https://registry.terraform.io/providers/integrations/github/latest/docs
    github = {
      source = "integrations/github"
    }

    # Docs:
    # - https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
    tailscale = {
      source = "tailscale/tailscale"
    }
  }
}

# Cloudflare
#
# Docs:
# - https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
#
# Export:
# - `CLOUDFLARE_API_KEY` and `CLOUDFLARE_EMAIL`
# OR
# - `CLOUDFLARE_API_TOKEN`
#
# Credentials
# - Name:
# - Permissions:
# - Settings URL: https://dash.cloudflare.com/profile/api-tokens
provider "cloudflare" {}

# Github
#
# Docs:
# - https://registry.terraform.io/providers/integrations/github/latest/docs
#
# Export:
# - `GITHUB_TOKEN`
#
# Credentials
# - Name: terraform-infrastructure-system-user
# - Permissions: public_repo, read:org
# - Settings URL: https://github.com/settings/tokens/1270530699
provider "github" {}

# Google
#
# Docs:
# - https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
#
# Export:
# - `GOOGLE_CREDENTIALS`, `GOOGLE_PROJECT`, `GOOGLE_REGION`, `GOOGLE_ZONE`
#
# Credentials
# - Name: tf-test-account
# - Permissions: Service Account User
# - Settings URL: https://console.cloud.google.com/iam-admin/serviceaccounts/details/112222367733525882864/permissions?project=starlit-factor-394405
#
# > Other Notes:
# >> Service Account Role: ?
# >> Service Account Permissions: ?
# >> Service Account Keys: https://console.cloud.google.com/iam-admin/serviceaccounts/details/112222367733525882864/keys?project=starlit-factor-394405
#
# Create a new service account: https://cloud.google.com/iam/docs/service-accounts-create#iam-service-accounts-create-gcloud
#
# gcloud iam service-accounts create SA_NAME \
#   --description="DESCRIPTION \
#   --display-name="DISPLAY_NAME
# provider "google" {
#   # project = "starlit-factor-394405"
#   # region  = "us-central1"
#   # zone    = "us-central1-c"
# }

# Tailscale
#
# Docs:
# - https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
#
# Export:
# - `TAILSCALE_API_KEY` and `TAILSCALE_TAILNET`
#
# Credentials:
# - Name:
# - Permissions:
# - Settings URL: https://login.tailscale.com/admin/settings/keys
provider "tailscale" {}
