terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.0"
    }
  }
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

# 기존 policy 정보 가져오기
data "vault_policy" "existing_policy" {
  count = var.manage_existing_policy
  name  = var.policy_name
}

# 기존 policy 규칙과 새 규칙 병합
locals {
  # 새로운 규칙들을 HCL 형태로 변환
  new_rules_hcl = join("\n\n", [
    for rule in var.policy_rules : 
    "path \"${rule.path}\" {\n  capabilities = ${jsonencode(rule.capabilities)}\n}"
  ])
  
  # 최종 policy: 기존 policy + 새 규칙
  final_policy = var.manage_existing_policy ? 
    "${data.vault_policy.existing_policy[0].policy}\n\n${local.new_rules_hcl}" :
    local.new_rules_hcl
}

resource "vault_policy" "policy" {
  name   = var.policy_name
  policy = local.final_policy
  
  lifecycle {
    # 기존 policy가 있을 때 실수로 삭제되지 않도록 보호
    prevent_destroy = var.manage_existing_policy
  }
}