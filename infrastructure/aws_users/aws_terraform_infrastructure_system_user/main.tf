## Label

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  enabled = true

  namespace   = "terraform"
  environment = "infrastructure"
}

module "aws_terraform_infrastructure_system_user" {
  source  = "cloudposse/iam-system-user/aws"
  version = "1.1.0"
  enabled = var.enabled

  ssm_enabled                   = false
  ssm_ses_smtp_password_enabled = false

  name    = "test-system-user-tf"
  context = module.label.context
}
