terraform {
  required_version = ">= 1.0.0"

  cloud {
    organization = "org-jasonriddle"

    workspaces {
      name = "terraform-infrastructure"
    }
  }

  required_providers {
    # DOCS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    # ENVS: AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
    # CRED: https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/users/details/Jason-AWSCLI?section=permissions
    aws = {
      source = "hashicorp/aws"
    }

    # DOCS: https://registry.terraform.io/providers/integrations/github/latest/docs
    # ENVS: GITHUB_TOKEN
    # CRED: https://github.com/settings/tokens/1270530699
    # USER: terraform-infrastructure-system-user
    # PERM: public_repo, read:org
    github = {
      source = "integrations/github"
    }

    # DOCS: https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
    # ENVS: TAILSCALE_API_KEY, TAILSCALE_TAILNET
    # CRED: https://login.tailscale.com/admin/settings/keys
    tailscale = {
      source = "tailscale/tailscale"
    }
  }
}
