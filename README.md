# Vault Policy Terraform

Vault policy를 Terraform으로 관리하기 위한 기본 설정입니다.

## 사용법

### 새 Policy 생성
1. 변수 파일 설정:
```bash
cp terraform.tfvars.example terraform.tfvars
# terraform.tfvars 파일을 편집하여 실제 값 입력
```

2. Terraform 초기화:
```bash
terraform init
```

3. 계획 확인:
```bash
terraform plan
```

4. 적용:
```bash
terraform apply
```

### 기존 Policy 관리
1. 기존 policy 정보 확인:
```bash
# manage_existing_policy = true로 설정 후
terraform plan
```

2. 기존 policy를 Terraform state로 import:
```bash
terraform import vault_policy.policy existing-policy-name
```

3. 새 규칙 추가 후 적용:
```bash
# policy_rules에 새 규칙 추가 후
terraform apply
```

### Policy 삭제
```bash
terraform destroy
```

## 파일 구조

- `main.tf`: 메인 Terraform 설정
- `variables.tf`: 변수 정의
- `outputs.tf`: 출력값 정의
- `terraform.tfvars.example`: 변수값 예시