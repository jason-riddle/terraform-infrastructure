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

resource "tailscale_tailnet_key" "pi_cluster_authkey" {
  count = 1

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

resource "tailscale_tailnet_key" "github_actions_ansible_role_tailscale_authkey" {
  count = 1

  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:github-actions-ansible-role-tailscale"]
}

output "github_actions_ansible_role_tailscale_authkey" {
  value     = tailscale_tailnet_key.github_actions_ansible_role_tailscale_authkey[0].key
  sensitive = true
}

resource "tailscale_tailnet_key" "k3s_subnet_router_authkey" {
  count = 1

  reusable      = true
  ephemeral     = false
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:k3s"]
}

output "k3s_subnet_router_authkey" {
  value     = tailscale_tailnet_key.k3s_subnet_router_authkey[0].key
  sensitive = true
}
