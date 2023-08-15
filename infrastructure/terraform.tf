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
    # - https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
    cloudflare = {
      source = "cloudflare/cloudflare"
    }

    # Docs:
    # - https://registry.terraform.io/providers/integrations/github/latest/docs
    github = {
      source = "integrations/github"
    }
  }
}

# Cloudflare
#
# Docs:
# - https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
#
# Export:
# - `CLOUDFLARE_API_KEY` and `CLOUDFLARE_EMAIL`
# OR
# - `CLOUDFLARE_API_TOKEN`
#
# Credentials
# - Name:
# - Permissions:
# - Settings URL: https://dash.cloudflare.com/profile/api-tokens
provider "cloudflare" {}

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
