# https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-user
module "iam_user1" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.30.0"

  name = "user1"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
}

# https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-group-with-policies
module "group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.30.0"

  name = "testgroup"

  group_users = [
    module.iam_user1.iam_user_name,
  ]
}

module "iam_github_oidc_provider" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
  version = "5.30.0"
}

# module "iam_github_oidc_role" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
#   version = "5.30.0"

#   name = local.name

#   # This should be updated to suit your organization, repository, references/branches, etc.
#   subjects = [
#     # You can prepend with `repo:` but it is not required
#     "repo:terraform-aws-modules/terraform-aws-iam:pull_request",
#     "terraform-aws-modules/terraform-aws-iam:ref:refs/heads/master",
#   ]

#   policies = {
#     additional = aws_iam_policy.additional.arn
#     S3ReadOnly = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
#   }

#   tags = local.tags
# }
