output "policy_name" {
  description = "Name of the created Vault policy"
  value       = vault_policy.policy.name
}

output "policy_id" {
  description = "ID of the created Vault policy"
  value       = vault_policy.policy.id
}

output "existing_policy" {
  description = "Existing policy information"
  value       = var.manage_existing_policy ? data.vault_policy.existing_policy[0].policy : null
}

output "final_policy" {
  description = "Final merged policy HCL"
  value       = vault_policy.policy.policy
}