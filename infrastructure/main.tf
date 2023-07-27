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

module "aws_tfc_role" {
  source = "./aws_tfc_role"
}

# output "openid_claims" {
#   value = module.aws_tfc_role.openid_claims
# }

output "tfc_role_arn" {
  value = module.aws_tfc_role.role_arn
}

#

module "aws_jason_cli_user" {
  source  = "./aws_users/aws_jason_cli_user"
  enabled = true
}

output "jason_access_key_id_ssm_path" {
  value     = module.aws_jason_cli_user.access_key_id_ssm_path
  sensitive = true
}

output "jason_secret_access_key_ssm_path" {
  value     = module.aws_jason_cli_user.secret_access_key_ssm_path
  sensitive = true
}

#

module "aws_terraform_infrastructure_system_user" {
  source  = "./aws_users/aws_terraform_infrastructure_system_user"
  enabled = true
}

output "system_access_key_id_ssm_path" {
  value     = module.aws_terraform_infrastructure_system_user.access_key_id_ssm_path
  sensitive = true
}

output "system_secret_access_key_ssm_path" {
  value     = module.aws_terraform_infrastructure_system_user.secret_access_key_ssm_path
  sensitive = true
}

#

module "aws_terraform_infrastructure_backup_system_user" {
  source  = "./aws_users/aws_terraform_infrastructure_backup_system_user"
  enabled = true
}

output "backup_system_access_key_id_ssm_path" {
  value     = module.aws_terraform_infrastructure_backup_system_user.access_key_id_ssm_path
  sensitive = true
}

output "backup_system_secret_access_key_ssm_path" {
  value     = module.aws_terraform_infrastructure_backup_system_user.secret_access_key_ssm_path
  sensitive = true
}

## Cloudflare

module "cloudflare_jasonriddle_com" {
  source = "./cloudflare/jasonriddle_com"
}

# module "cloudflare_jrapps_org" {
#   source = "./cloudflare/jrapps_org"
# }

module "cloudflare_riddleapps_net" {
  source = "./cloudflare/riddleapps_net"
}

## GitHub

# module "github_ansible_labs" {
#   source    = "./github/public_repo"
#   repo_name = "ansible-labs"
# }

# module "github_dotfiles" {
#   source    = "./github/public_repo"
#   repo_name = "dotfiles"
# }

# module "github_dotv2" {
#   source    = "./github/public_repo"
#   repo_name = "dotv2"
# }

# module "github_infrastructure" {
#   source    = "./github/public_repo"
#   repo_name = "infrastructure"
# }

# module "github_tailscale_acls" {
#   source    = "./github/private_repo"
#   repo_name = "tailscale-acls"
# }

# module "github_terraform_infrastructure" {
#   source    = "./github/public_repo"
#   repo_name = "terraform-infrastructure"
# }

## Kubernetes

module "k8s_cluster" {
  source  = "./k8s_cluster"
  enabled = false
}

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

module "vault_cluster" {
  source  = "./vault_cluster"
  enabled = false
}

# module "vault_manifests" {
#   source  = "./vault_manifests"
#   enabled = false
# }
