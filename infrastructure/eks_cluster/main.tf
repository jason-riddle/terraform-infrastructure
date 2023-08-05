module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.1.0"
  enabled = var.enabled

  ipv4_primary_cidr_block = "10.0.0.0/16"

  assign_generated_ipv6_cidr_block          = false
  ipv6_egress_only_internet_gateway_enabled = false

  internet_gateway_enabled = false

  context = module.this.context
}
