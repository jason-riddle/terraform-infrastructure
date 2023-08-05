## Label

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  enabled = true

  namespace   = "terraform"
  environment = "infrastructure"
}

## EKS - PREQS

module "aws_eks_vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.1.0"
  enabled = var.enabled

  cidr_block = "172.16.0.0/16"

  ipv6_egress_only_internet_gateway_enabled = false

  context = module.label.context
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.4.1"
  enabled = var.enabled

  vpc_id     = module.aws_eks_vpc.vpc_id
  igw_id     = module.aws_eks_vpc.igw_id
  cidr_block = module.aws_eks_vpc.vpc_cidr_block

  nat_gateway_enabled  = false
  nat_instance_enabled = false

  context = module.label.context
}

## EKS

module "aws_eks_cluster" {
  source  = "cloudposse/eks-cluster/aws"
  version = "2.9.0"
  enabled = var.enabled

  vpc_id     = module.aws_eks_vpc.vpc_id
  subnet_ids = module.aws_eks_subnets.public_subnet_ids
}
