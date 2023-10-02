# AWS
module "aws" {
  source = "./aws/accounts/personal"
}

# Cloudflare
module "cf_jasonriddle_com" {
  source = "./cloudflare/zones/jasonriddle_com"
}

module "cf_riddleapps_net" {
  source = "./cloudflare/zones/riddleapps_net"
}

# Digitalocean
module "do" {
  source  = "./digitalocean/k8s_cluster"
  enabled = false
}

output "do_k8s_cluster_kube_config" {
  value     = module.do.k8s_cluster_kube_config
  sensitive = true
}

output "do_k8s_cluster_kube_config_token" {
  value     = module.do.k8s_cluster_kube_config_token
  sensitive = true
}

output "do_k8s_cluster_ca_certificate" {
  value     = module.do.k8s_cluster_ca_certificate
  sensitive = true
}

output "do_k8s_cluster_endpoint" {
  value     = module.do.k8s_cluster_endpoint
  sensitive = true
}

# Github
module "gh_ansible_role_tailscale" {
  source = "./github/repos/ansible_role_tailscale"

  secret_name            = "TAILSCALE_AUTHKEY"
  secret_plaintext_value = module.ts_jasonriddle11_gmail_com.github_actions_ansible_role_tailscale_authkey
}

module "gh_homelab" {
  source = "./github/repos/homelab"

  secret_name            = "GHA_TAILSCALE_AUTHKEY"
  secret_plaintext_value = module.ts_jasonriddle11_gmail_com.github_actions_homelab_authkey
}

module "gh_terraform_infrastructure" {
  source = "./github/repos/terraform_infrastructure"
}

# Tailscale
module "ts_jasonriddle11_gmail_com" {
  source = "./tailscale/tailnets/jasonriddle11_gmail_com"
}

# AWS
module "aws_accounts_personal" {
  source = "./aws/accounts/personal"
}
