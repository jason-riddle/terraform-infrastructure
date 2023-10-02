resource "aws_iam_group" "temp" {
  name = "temp"
}

module "oidc_github" {
  source  = "unfunco/oidc-github/aws"
  version = "1.6.0"

  github_repositories = [
    "org/repo",
    "another-org/another-repo:ref:refs/heads/main",
  ]
}
