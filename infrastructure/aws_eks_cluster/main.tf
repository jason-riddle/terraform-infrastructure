## Label

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  enabled = true

  namespace   = "terraform"
  environment = "infrastructure"
}

## EKS

module "aws_eks_cluster" {
  source  = "cloudposse/eks-cluster/aws"
  version = "2.9.0"
  enabled = var.enabled

  # source  = "cloudposse/eks-cluster/aws//examples/complete"

}
