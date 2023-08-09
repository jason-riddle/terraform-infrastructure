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
