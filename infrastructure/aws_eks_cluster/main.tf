module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  # namespace   = "terraform"
  # environment = "infrastructure"
  # attributes  = ["cluster"]

  context = module.this.context
}
