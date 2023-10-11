# AWS
module "aws" {
  source = "./aws/accounts/personal"
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

output "ts_pi_cluster_authkey" {
  value     = module.ts_jasonriddle11_gmail_com.pi_cluster_authkey
  sensitive = true
}
