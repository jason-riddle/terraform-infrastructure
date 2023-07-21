## AWS

# Set `AWS_REGION`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY`
# REF: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {}

## Cloudflare

# Set (`CLOUDFLARE_API_KEY` and `CLOUDFLARE_EMAIL`) or `CLOUDFLARE_API_TOKEN`
# API TOKENS: https://dash.cloudflare.com/profile/api-tokens
# REF: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
provider "cloudflare" {}

## DigitalOcean

# Set `DIGITALOCEAN_TOKEN` or `DIGITALOCEAN_ACCESS_TOKEN`
# API TOKENS: https://cloud.digitalocean.com/account/api/tokens
# REF: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
# provider "digitalocean" {}

## GitHub

# Set `GITHUB_TOKEN`
# REF: https://registry.terraform.io/providers/integrations/github/latest/docs
# Token Info
# > Token Name: terraform-infrastructure-github-token
# > Token Permissions: public_repo, read:discussion, read:org
# > Token Settings URL: https://github.com/settings/tokens
provider "github" {}

## HCP

# Set `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET`
# REF: https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth
provider "hcp" {}

## Tailscale

# Set `TAILSCALE_API_KEY` and `TAILSCALE_TAILNET`
# REF: https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
provider "tailscale" {}
