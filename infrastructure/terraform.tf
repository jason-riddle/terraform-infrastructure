terraform {
  required_version = ">= 0.13.0"

  cloud {
    organization = "org-jasonriddle"

    workspaces {
      name = "terraform-infrastructure"
    }
  }

  required_providers {
    # DOCS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source = "hashicorp/aws"
      # This provider updates frequently, so allow greater than 4.0 but not 5.0
      version = "~> 4.0"
    }
    # DOCS: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.10.0"
    }
    # DOCS: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
    # digitalocean = {
    #   source  = "digitalocean/digitalocean"
    #   version = ">= 2.29.0"
    # }
    # DOCS: https://registry.terraform.io/providers/integrations/github/latest/docs
    # github = {
    #   source  = "integrations/github"
    #   version = ">= 5.31.0"
    # }
    # DOCS: https://registry.terraform.io/providers/hashicorp/google/latest/docs
    # google = {
    #   source  = "hashicorp/google"
    #   version = ">= 4.76.0"
    # }
    # DOCS: https://registry.terraform.io/providers/hashicorp/hcp/latest/docs
    # hcp = {
    #   source  = "hashicorp/hcp"
    #   version = ">= 0.66.0"
    # }
    # DOCS: https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
    tailscale = {
      source  = "tailscale/tailscale"
      version = ">= 0.13.7"
    }
    # DOCS: https://registry.terraform.io/providers/hashicorp/vault/latest/docs
    # vault = {
    #   source  = "hashicorp/vault"
    #   version = ">= 3.18.0"
    # }
  }
}
