module "iam_user1" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.30.0"

  name = "user1"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
}

module "group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.30.0"

  name = "testgroup"

  group_users = [
    module.iam_user1.iam_user_name,
  ]
}
