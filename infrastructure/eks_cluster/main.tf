module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.1.0"
  enabled = var.enabled

  ipv4_primary_cidr_block = "10.0.0.0/16"

  assign_generated_ipv6_cidr_block = false

  internet_gateway_enabled                  = false
  ipv6_egress_only_internet_gateway_enabled = false

  context = module.this.context
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.4.1"
  enabled = var.enabled

  # ipv4_cidr_block = "10.0.0.0/16"

  vpc_id = module.vpc.vpc_id
  # igw_id = [module.vpc.igw_id]

  nat_gateway_enabled  = false
  nat_instance_enabled = false

  context = module.this.context
}

module "eks_cluster" {
  source  = "cloudposse/eks-cluster/aws"
  version = "2.9.0"
  enabled = var.enabled

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.subnets.public_subnet_ids

  context = module.this.context
}
