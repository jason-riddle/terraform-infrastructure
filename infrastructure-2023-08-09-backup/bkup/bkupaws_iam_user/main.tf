module "aws_cli_user" {
  source  = "cloudposse/iam-system-user/aws"
  version = "1.1.0"
  enabled = var.enabled

  ssm_enabled                   = true
  ssm_ses_smtp_password_enabled = false

  name = "jason"

  policy_arns_map = {
    admin = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

  context = module.this.context
}

## Output

output "access_key_id_ssm_path" {
  value = module.aws_cli_user.access_key_id_ssm_path
}

output "secret_access_key_ssm_path" {
  value = module.aws_cli_user.secret_access_key_ssm_path
}
