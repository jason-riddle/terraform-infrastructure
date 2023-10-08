# Ephemeral

resource "tailscale_tailnet_key" "github_actions_ansible_role_tailscale_authkey" {
  count = 1

  description = "GHA - Ansible Role Tailscale Authkey"

  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:github-actions"]
}

output "github_actions_ansible_role_tailscale_authkey" {
  value     = tailscale_tailnet_key.github_actions_ansible_role_tailscale_authkey[0].key
  sensitive = true
}

resource "tailscale_tailnet_key" "github_actions_homelab_authkey" {
  count = 1

  description = "GHA - Homelab Authkey"

  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:github-actions"]
}

output "github_actions_homelab_authkey" {
  value     = tailscale_tailnet_key.github_actions_homelab_authkey[0].key
  sensitive = true
}

# Not Ephemeral

resource "tailscale_tailnet_key" "pi_cluster_authkey" {
  count = 1

  description = "Pi Cluster Authkey"

  reusable      = true
  ephemeral     = false
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:pi-cluster"]
}

output "pi_cluster_authkey" {
  value     = tailscale_tailnet_key.pi_cluster_authkey[0].key
  sensitive = true
}
