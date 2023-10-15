terraform {
  required_providers {
    # DOCS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    # ENVS: AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
    # CRED: https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/users/details/Jason-AWSCLI?section=permissions
    aws = {
      source = "hashicorp/aws"
    }
  }
}
