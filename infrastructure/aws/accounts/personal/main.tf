module "group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.30.0"

  name = "testgroup"
}
