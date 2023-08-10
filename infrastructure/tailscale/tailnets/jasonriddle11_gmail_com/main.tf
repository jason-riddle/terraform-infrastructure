resource "tailscale_tailnet_key" "pi_authkey" {
  count = 1

  reusable      = true
  ephemeral     = false
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:pi"]
}

output "pi_authkey" {
  value     = tailscale_tailnet_key.pi_authkey[0].key
  sensitive = true
}

resource "tailscale_tailnet_key" "github_actions_authkey" {
  count = 1

  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:github-actions"]
}

output "github_actions_authkey" {
  value     = tailscale_tailnet_key.github_actions_authkey[0].key
  sensitive = true
}
