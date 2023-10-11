data "github_repository" "repo" {
  full_name = "jason-riddle/homelab"
}

resource "github_actions_secret" "secret" {
  repository      = data.github_repository.repo.name
  secret_name     = var.secret_name
  plaintext_value = var.secret_plaintext_value
}
