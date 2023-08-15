terraform {
  required_version = ">= 1.0.0"

  required_providers {
    # Docs:
    # - https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
    cloudflare = {
      source = "cloudflare/cloudflare"
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
# provider "cloudflare" {}
