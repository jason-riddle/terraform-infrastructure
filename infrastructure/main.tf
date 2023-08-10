# Cloudflare
module "cf_jasonriddle_com" {
  source = "./cloudflare/zones/jasonriddle_com"
}

module "cf_riddleapps_net" {
  source = "./cloudflare/zones/riddleapps_net"
}

# Github
module "gh_terraform_infrastructure" {
  source = "./github/repos/terraform_infrastructure"

  secret_name            = "FOO"
  secret_plaintext_value = "BAR"
}

# Tailscale
module "ts_jasonriddle11_gmail_com" {
  source = "./tailscale/tailnets/jasonriddle11_gmail_com"
}

output "ts_pi_authkey" {
  value     = module.ts_jasonriddle11_gmail_com.pi_authkey
  sensitive = true
}

output "ts_github_actions_authkey" {
  value     = module.ts_jasonriddle11_gmail_com.github_actions_authkey
  sensitive = true
}
