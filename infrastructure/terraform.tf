terraform {
  required_version = ">= 1.0.0"

  cloud {
    organization = "org-jasonriddle"

    workspaces {
      name = "terraform-infrastructure"
    }
  }

  required_providers {
    # Docs:
    # - https://registry.terraform.io/providers/integrations/github/latest/docs
    github = {
      source = "integrations/github"
    }
  }
}

# Github
#
# Docs:
# - https://registry.terraform.io/providers/integrations/github/latest/docs
#
# Export:
# - `GITHUB_TOKEN`
#
# Credentials
# - Name: terraform-infrastructure-system-user
# - Permissions: public_repo, read:org
# - Settings URL: https://github.com/settings/tokens/1270530699
provider "github" {}
