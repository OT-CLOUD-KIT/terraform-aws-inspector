data "aws_caller_identity" "calling_account" {}

resource "aws_inspector2_delegated_admin_account" "admin_account" {
  count      = var.initialize_delegated_admin_account == true ? 1 : 0
  account_id = data.aws_caller_identity.calling_account.id
}

resource "aws_inspector2_enabler" "enable_inspector_admin_account" {
  count          = var.enable_delegated_admin_account == true ? 1 : 0
  account_ids    = [data.aws_caller_identity.calling_account.account_id]
  resource_types = var.enabled_resources_admin_account
}

resource "aws_inspector2_enabler" "enable_member_accounts" {
  count          = var.enable_member_accounts == true ? 1 : 0
  account_ids    = var.member_accounts
  resource_types = var.enabled_resources_member_account
}

resource "aws_inspector2_organization_configuration" "example" {
  count = var.auto_enable_member_accounts == true ? 1 : 0
  auto_enable {
    ec2         = contains(var.auto_enable, "EC2")
    ecr         = contains(var.auto_enable, "ECR")
    lambda      = contains(var.auto_enable, "LAMDA")
    lambda_code = contains(var.auto_enable, "LAMBDA_CODE")
  }
}

resource "aws_inspector2_member_association" "example" {
  count      = var.enable_account_associate == true ? 1 : 0
  account_id = var.account_associate
}
