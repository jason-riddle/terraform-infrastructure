terraform {
  required_version = ">= 1.0.0"

  required_providers {
    # Docs:
    # - https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
    tailscale = {
      source = "tailscale/tailscale"
    }
  }
}

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
# provider "tailscale" {}
