
module "aws_inspector_2" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-inspector.git?ref=Feature"
  aws_inspector_2_enable           = var.aws_inspector_2_enable
  enabled_resources_admin_account  = var.enabled_resources_admin_account

  initialize_delegated_admin_account = var.initialize_delegated_admin_account
  enable_delegated_admin_account     = var.enable_delegated_admin_account

  enable_member_accounts           = var.enable_member_accounts
  member_accounts                  = var.member_accounts
  enabled_resources_member_account = var.enabled_resources_member_account

  auto_enable                 = var.auto_enable
  auto_enable_member_accounts = var.auto_enable_member_accounts

  enable_account_associate = var.enable_account_associate
  account_associate        = var.account_associate
}
