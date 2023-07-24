variable "enabled" {
  type    = bool
  default = null
}

variable "cluster_id" {
  type      = string
  default   = null
  sensitive = true
}

# variable "provider_vault_address" {
#   type      = string
#   default   = null
#   sensitive = true
# }

# variable "provider_vault_token" {
#   type      = string
#   default   = null
#   sensitive = true
# }
