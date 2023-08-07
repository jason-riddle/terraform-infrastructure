## AWS

module "eks_cluster" {
  source  = "./eks_cluster"
  enabled = false

  context = module.this.context
}

## Cloudflare

# jasonriddle.com
data "cloudflare_zone" "jasonriddle_com" {
  name = "jasonriddle.com"
}

resource "cloudflare_page_rule" "wp_admin" {
  count = 1

  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  target   = "*jasonriddle.com/wp-admin*"
  priority = 1

  actions {
    cache_level = "bypass"
  }
}

# resource "cloudflare_page_rule" "preview" {
#   count = 1

#   zone_id  = data.cloudflare_zone.jrapps_org.id
#   target   = "*jasonriddle.com/*preview=true*"
#   priority = 2

#   actions {
#     cache_level = "bypass"
#   }
# }

# resource "cloudflare_page_rule" "preview" {
#   count = 1

#   zone_id  = data.cloudflare_zone.jrapps_org.id
#   target   = "*jasonriddle.com/*"
#   priority = 3

#   actions {
#     cache_level = "bypass"
#   }
# }

# riddleapps.net
data "cloudflare_zone" "riddleapps_net" {
  name = "riddleapps.net"
}

# nextcloud.riddleapps.net
resource "cloudflare_record" "riddleapps_net_nx15310_your_storageshare_de" {
  count = 1

  zone_id = data.cloudflare_zone.riddleapps_net.id
  name    = "nextcloud"
  value   = "nx15310.your-storageshare.de"
  type    = "CNAME"
  ttl     = 1
  proxied = false
}

## GitHub

# module "github_ansible_labs" {
#   source    = "./github/ansible_labs"
#   repo_name = "ansible-labs"
# }

# module "github_dotv2" {
#   source    = "./github/dotv2"
#   repo_name = "dotv2"
# }

# module "github_tailscale_acls" {
#   source    = "./github/tailscale_acls"
#   repo_name = "tailscale-acls"
# }

# module "github_terraform_infrastructure" {
#   source    = "./github/terraform_infrastructure"
#   repo_name = "terraform-infrastructure"
# }

## Google

# resource "google_service_account" "service_account" {
#   count = 1

#   account_id   = "service-account-id"
#   display_name = "Service Account Name"
# }

## Kubernetes

## Tailscale

# data "tailscale_devices" "devices" {
#   name_prefix = "jasons-"
# }

# output "tailscale_devices" {
#   value = data.tailscale_devices.devices
# }

#

resource "tailscale_dns_preferences" "dns_preferences" {
  count = 1

  magic_dns = true
}

#

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

## Vault
