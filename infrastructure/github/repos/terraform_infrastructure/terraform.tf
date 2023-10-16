terraform {
  required_providers {
    # DOCS: https://registry.terraform.io/providers/integrations/github/latest/docs
    # ENVS: GITHUB_TOKEN
    # CRED: https://github.com/settings/tokens/1270530699
    # USER: terraform-infrastructure-system-user
    # PERM: public_repo, read:org
    github = {
      source = "integrations/github"
    }
  }
}
