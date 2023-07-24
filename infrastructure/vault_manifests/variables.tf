variable "enabled" {
  type    = bool
  default = null
}

variable "vault_cluster_address" {
  type      = string
  default   = null
  sensitive = true
}

variable "vault_cluster_token" {
  type      = string
  default   = null
  sensitive = true
}
