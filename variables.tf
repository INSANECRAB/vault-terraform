variable "vault_address" {
  description = "Vault server address"
  type        = string
  default     = "http://localhost:8200"
}

variable "vault_token" {
  description = "Vault authentication token"
  type        = string
  sensitive   = true
}

variable "policy_name" {
  description = "Name of the Vault policy"
  type        = string
}

variable "policy_rules" {
  description = "List of policy rules with path and capabilities"
  type = list(object({
    path         = string
    capabilities = list(string)
    description  = optional(string)
  }))
}

variable "manage_existing_policy" {
  description = "Whether to manage existing policy (merge with new rules)"
  type        = bool
  default     = false
}