resource "tailscale_tailnet_key" "raspberry_pi_authkey" {
  count = 1

  reusable      = true
  ephemeral     = false
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:pi"]
}

output "tailscale_raspberry_pi_authkey" {
  value     = tailscale_tailnet_key.raspberry_pi_authkey[0].key
  sensitive = true
}

resource "tailscale_tailnet_key" "ansible_role_tailscale_github_ci_authkey" {
  count = 1

  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:github-ci"]
}

output "tailscale_ansible_role_tailscale_github_ci_authkey" {
  value     = tailscale_tailnet_key.ansible_role_tailscale_github_ci_authkey[0].key
  sensitive = true
}

