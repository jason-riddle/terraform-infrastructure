terraform {
  required_providers {
    # DOCS: https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
    # ENVS: TAILSCALE_API_KEY, TAILSCALE_TAILNET
    # CRED: https://login.tailscale.com/admin/settings/keys
    tailscale = {
      source = "tailscale/tailscale"
    }
  }
}
