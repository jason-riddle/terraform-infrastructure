module "system_user" {
  source  = "cloudposse/iam-system-user/aws"
  version = "1.1.0"
  enabled = false

  ssm_enabled                   = false
  ssm_ses_smtp_password_enabled = false

  name    = "test-system-user-tf"
  context = module.label.context
}
