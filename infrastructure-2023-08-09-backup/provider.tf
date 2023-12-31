## AWS

# Set `AWS_REGION`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY`
# DOCS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {}

## Cloudflare

# Set (`CLOUDFLARE_API_KEY` and `CLOUDFLARE_EMAIL`) or `CLOUDFLARE_API_TOKEN`
# DOCS: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
# Credentials
# > Name:
# > Permissions:
# > Settings URL: https://dash.cloudflare.com/profile/api-tokens
provider "cloudflare" {}

## DigitalOcean

# Set `DIGITALOCEAN_TOKEN` or `DIGITALOCEAN_ACCESS_TOKEN`
# DOCS: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
# Credentials
# > Name: terraform-infrastructure-system-user
# > Permissions: Read, Write
# > Settings URL: https://cloud.digitalocean.com/account/api/tokens/156701434?i=e83cb6
# provider "digitalocean" {}

## GitHub

# Set `GITHUB_TOKEN`
# DOCS: https://registry.terraform.io/providers/integrations/github/latest/docs
# Credentials
# > Name: terraform-infrastructure-system-user
# > Permissions: public_repo, read:org
# > Settings URL: https://github.com/settings/tokens/1270530699
# provider "github" {}

## Google

# Set `GOOGLE_CREDENTIALS`, `GOOGLE_PROJECT`, `GOOGLE_REGION`, `GOOGLE_ZONE`
# DOCS: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
# Credentials
# > Name: tf-test-account
# > Permissions: Service Account User
# > Settings URL: https://console.cloud.google.com/iam-admin/serviceaccounts/details/112222367733525882864/permissions?project=starlit-factor-394405
# > Other Notes:
# >> Service Account Role: ?
# >> Service Account Permissions: ?
# >> Service Account Keys: https://console.cloud.google.com/iam-admin/serviceaccounts/details/112222367733525882864/keys?project=starlit-factor-394405
#
# Create a new service account: https://cloud.google.com/iam/docs/service-accounts-create#iam-service-accounts-create-gcloud
#
# gcloud iam service-accounts create SA_NAME \
#   --description="DESCRIPTION \
#   --display-name="DISPLAY_NAME \
#
provider "google" {
  project = "starlit-factor-394405"
  # region  = "us-central1"
  # zone    = "us-central1-c"
}

## HCP

# Set `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET`
# DOCS: https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth
# Credentials
# > Name:
# > Permissions:
# > Settings URL: https://portal.cloud.hashicorp.com/access/service-principals?org_id=c3fd7556-9d82-49b1-9138-0207ce01936d&project_id=32bf730d-122a-4e77-888a-1cdbb7eacbde
# provider "hcp" {}

## Tailscale

# Set `TAILSCALE_API_KEY` and `TAILSCALE_TAILNET`
# DOCS: https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
# Credentials
# > Name:
# > Permissions:
# > Settings URL: https://login.tailscale.com/admin/settings/keys
provider "tailscale" {}
