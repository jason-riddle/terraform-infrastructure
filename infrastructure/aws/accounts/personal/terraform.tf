terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# AWS
#
# Docs:
# - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
#
# Export:
# - `AWS_REGION`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY`
#
# Credentials
# - Name:
# - Permissions:
# - Settings URL: https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/users/details/Jason-AWSCLI?section=permissions
#
# provider "aws" {}
