terraform {
  required_version = ">= 1.0.0"

  cloud {
    organization = "org-jasonriddle"

    workspaces {
      name = "terraform-infrastructure"
    }
  }

  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    # https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/users/details/Jason-AWSCLI?section=permissions
    # AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
    aws = {
      source = "hashicorp/aws"
    }

    # https://registry.terraform.io/providers/integrations/github/latest/docs
    # https://registry.terraform.io/providers/integrations/github/latest/docs
    # GITHUB_TOKEN
    # https://github.com/settings/tokens/1270530699
    # Name: terraform-infrastructure-system-user
    # Permissions: public_repo, read:org
    github = {
      source = "integrations/github"
    }

    # https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
    # https://login.tailscale.com/admin/settings/keys
    # TAILSCALE_API_KEY, TAILSCALE_TAILNET
    tailscale = {
      source = "tailscale/tailscale"
    }
  }
}
