module "cli_user" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"
  enabled = var.enabled

  user_name = "test2-cli-user-jason"
  groups    = []

  pgp_key                 = ""
  password_length         = 24
  password_reset_required = true
  login_profile_enabled   = false

  name    = "test3-cli-user-jason"
  context = module.label.context
}
