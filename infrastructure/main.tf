## Label

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  enabled = true

  namespace   = "terraform"
  environment = "infrastructure"
}

## AWS

#

# module "aws_tfc_oidc_role" {
#   source  = "./aws_tfc_oidc_role"
#   enabled = true
# }

# output "openid_claims" {
#   value = module.aws_tfc_role.openid_claims
# }

# output "aws_tfc_oidc_role_arn" {
#   value = module.aws_tfc_oidc_role.role_arn
# }

#

# module "aws_jason_cli_user" {
#   source  = "./aws_users/aws_jason_cli_user"
#   enabled = false
# }

# output "jason_access_key_id_ssm_path" {
#   value = module.aws_jason_cli_user.access_key_id_ssm_path
# }

# output "jason_secret_access_key_ssm_path" {
#   value = module.aws_jason_cli_user.secret_access_key_ssm_path
# }

#

# module "aws_terraform_infrastructure_system_user" {
#   source  = "./aws_users/aws_terraform_infrastructure_system_user"
#   enabled = false
# }

# output "system_access_key_id_ssm_path" {
#   value = module.aws_terraform_infrastructure_system_user.access_key_id_ssm_path
# }

# output "system_secret_access_key_ssm_path" {
#   value = module.aws_terraform_infrastructure_system_user.secret_access_key_ssm_path
# }

#

# module "backup_aws_terraform_infrastructure_system_user" {
#   source  = "./aws_users/backup_aws_terraform_infrastructure_system_user"
#   enabled = false
# }

# output "backup_system_access_key_id_ssm_path" {
#   value = module.backup_aws_terraform_infrastructure_system_user.access_key_id_ssm_path
# }

# output "backup_system_secret_access_key_ssm_path" {
#   value = module.backup_aws_terraform_infrastructure_system_user.secret_access_key_ssm_path
# }

## Cloudflare

module "cloudflare_jasonriddle_com" {
  source = "./cloudflare/jasonriddle_com"
}

# jasonriddle.com
data "cloudflare_zone" "jasonriddle_com" {
  name = "jasonriddle.com"
}

resource "cloudflare_page_rule" "wp_admin" {
  count = 0

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


module "cloudflare_riddleapps_net" {
  source = "./cloudflare/riddleapps_net"
}

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

  # lifecycle {
  #   prevent_destroy = true
  # }
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

module "google_gcp_service_accounts" {
  source  = "./google_gcp_service_accounts"
  enabled = false
}

## Kubernetes

# module "k8s_cluster" {
#   source  = "./k8s_cluster"
#   enabled = false
# }

# module "k8s_manifests" {
#   source  = "./k8s_manifests"
#   enabled = false
# }

## Tailscale

# data "tailscale_devices" "devices" {
#   name_prefix = "jasons-"
# }

# output "tailscale_devices" {
#   value = data.tailscale_devices.devices
# }

#

resource "tailscale_dns_preferences" "dns_preferences" {
  magic_dns = true
}

#

resource "tailscale_tailnet_key" "raspberry_pi_authkey" {
  reusable      = true
  ephemeral     = false
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:pi"]
}

output "tailscale_raspberry_pi_authkey" {
  value     = tailscale_tailnet_key.raspberry_pi_authkey.key
  sensitive = true
}

resource "tailscale_tailnet_key" "ansible_role_tailscale_github_ci_authkey" {
  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = 7776000 # 90 Days
  tags          = ["tag:github-ci"]
}

output "tailscale_ansible_role_tailscale_github_ci_authkey" {
  value     = tailscale_tailnet_key.ansible_role_tailscale_github_ci_authkey.key
  sensitive = true
}

## Vault

# module "vault_cluster" {
#   source  = "./vault_cluster"
#   enabled = false
# }

# module "vault_manifests" {
#   source  = "./vault_manifests"
#   enabled = false
# }
