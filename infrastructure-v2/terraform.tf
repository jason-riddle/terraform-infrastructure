terraform {
  required_version = ">= 1.0.0"

  cloud {
    #
  }

  required_providers {
    # Docs:
    # - https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
    tailscale = {
      source = "tailscale/tailscale"
    }
  }
}

# Tailscale

# Set:
# - `TAILSCALE_API_KEY`
# - `TAILSCALE_TAILNET`
#
# Docs:
# - https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
#
# Credentials:
# - Name:
# - Permissions:
# - Settings URL: https://login.tailscale.com/admin/settings/keys
provider "tailscale" {}
