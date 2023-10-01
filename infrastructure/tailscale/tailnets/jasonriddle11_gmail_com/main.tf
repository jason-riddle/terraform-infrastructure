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

# resource "tailscale_tailnet_key" "pi_cluster_authkey" {
#   count = 1

#   reusable      = true
#   ephemeral     = false
#   preauthorized = true
#   expiry        = 7776000 # 90 Days
#   tags          = ["tag:pi-cluster"]
# }

# output "pi_cluster_authkey" {
#   value     = tailscale_tailnet_key.pi_cluster_authkey[0].key
#   sensitive = true
# }

# resource "tailscale_tailnet_key" "subnet_router_authkey" {
#   count = 1

#   reusable      = true
#   ephemeral     = false
#   preauthorized = true
#   expiry        = 7776000 # 90 Days
#   tags          = ["tag:subnet-router"]
# }

# output "subnet_router_authkey" {
#   value     = tailscale_tailnet_key.subnet_router_authkey[0].key
#   sensitive = true
# }
