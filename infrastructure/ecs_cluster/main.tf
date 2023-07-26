## Label

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  enabled = true

  namespace   = "terraform"
  environment = "infrastructure"
}

module "ecs_cluster" {
  source  = "cloudposse/ecs-cluster/aws"
  version = "0.4.1"

  context = module.label.context

  container_insights_enabled      = false
  capacity_providers_fargate      = false
  capacity_providers_fargate_spot = false
}
