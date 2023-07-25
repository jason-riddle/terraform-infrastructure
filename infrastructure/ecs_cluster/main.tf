# module "vpc" {
#   source  = "cloudposse/vpc/aws"
#   version = "1.2.0"

#   context                 = module.label.context
#   ipv4_primary_cidr_block = "172.16.0.0/16"
# }

# module "subnets" {
#   source  = "cloudposse/dynamic-subnets/aws"
#   version = "2.0.4"

#   context              = module.label.context
#   availability_zones   = var.availability_zones
#   vpc_id               = module.vpc.vpc_id
#   igw_id               = [module.vpc.igw_id]
#   ipv4_cidr_block      = [module.vpc.vpc_cidr_block]
#   nat_gateway_enabled  = false
#   nat_instance_enabled = false
# }

module "ecs_cluster" {
  source = "cloudposse/ecs-cluster/aws"

  context = module.label.context

  container_insights_enabled      = false
  capacity_providers_fargate      = false
  capacity_providers_fargate_spot = false
  capacity_providers_ec2          = false
}
