data "github_repository" "repo" {
  full_name = "jason-riddle/terraform-infrastructure"
}

resource "github_branch_protection" "main" {
  count = 1

  repository_id = data.github_repository.repo.node_id

  pattern = "main"

  allows_deletions        = false
  allows_force_pushes     = false
  enforce_admins          = false
  required_linear_history = true

  required_status_checks {
    strict = true
  }
}

resource "github_actions_secret" "secret" {
  repository      = data.github_repository.repo.name
  secret_name     = "example_secret_name"
  plaintext_value = "123"
}
