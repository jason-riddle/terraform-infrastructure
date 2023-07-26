module "aws_console_user" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"
  enabled = var.enabled

  user_name = "test4-console-user-jason"
  groups    = []

  pgp_key                 = ""
  password_length         = 24
  password_reset_required = true
  login_profile_enabled   = true

  name    = "test5-console-user-jason"
  context = module.label.context
}
