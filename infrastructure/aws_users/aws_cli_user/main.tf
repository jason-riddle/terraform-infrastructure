## Label

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  enabled = true

  namespace   = "terraform"
  environment = "infrastructure"
}

module "aws_cli_user" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"
  enabled = var.enabled

  user_name = "test2-cli-user-jason"
  groups    = []

  pgp_key               = ""
  login_profile_enabled = false

  name = "test3-cli-user-jason"

  context = module.label.context
}
