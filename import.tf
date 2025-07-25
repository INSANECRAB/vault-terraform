# 기존 수동 생성된 policy를 Terraform으로 관리하기
# 
# 1단계: 기존 policy 확인
# manage_existing_policy = true로 설정 후 terraform plan 실행
#
# 2단계: Terraform state로 import
# terraform import vault_policy.policy existing-policy-name
#
# 3단계: 새 규칙 추가 후 apply
# policy_rules에 새 규칙 추가 후 terraform apply

# Terraform 1.5+ import 블록 사용 시:
# import {
#   to = vault_policy.policy
#   id = "existing-policy-name"
# }