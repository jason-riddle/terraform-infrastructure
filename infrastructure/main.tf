# Cloudflare
module "cf_jasonriddle_com" {
  source = "./cloudflare/zones/jasonriddle_com"
}

# Tailscale
module "ts_jasonriddle11_gmail_com" {
  source = "./tailscale/tailnets/jasonriddle11_gmail_com"
}

output "ts_pi_authkey" {
  value     = ts_jasonriddle11_gmail_com.pi_authkey
  sensitive = true
}

output "ts_github_actions_authkey" {
  value     = ts_jasonriddle11_gmail_com.github_actions_authkey
  sensitive = true
}
