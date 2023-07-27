output "openid_claims" {
  sensitive   = true
  description = "OpenID Claims for trust relationship"
  value       = one(jsondecode(aws_iam_role.tfc_role.assume_role_policy).Statement).Condition
}

output "role_arn" {
  sensitive   = true
  description = "ARN for trust relationship role"
  value       = aws_iam_role.tfc_role.arn
}
