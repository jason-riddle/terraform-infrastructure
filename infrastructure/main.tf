# Cloudflare
module "cf_jasonriddle_com" {
  source = "./cloudflare/zones/jasonriddle_com"
}

# Tailscale
module "ts_jasonriddle11_gmail_com" {
  source = "./tailscale/tailnets/jasonriddle11_gmail_com"
}
