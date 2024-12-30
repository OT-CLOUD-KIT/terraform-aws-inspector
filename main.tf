## Classic inspector requires you to run the assesmnet manually from the console.

## AWS_Inspector module starting.

module "aws_inspector_classic" {
  count               = var.aws_inspector_classic_enable == true ? 1 : 0
  source              = "./modules/aws_inspector_classic"
  resource_group_tags = { "Name" = "Inspector_check" }
  event               = var.event
  duration            = var.duration
}

module "aws_inspector_2" {
  count                              = var.aws_inspector_2_enable == "true" ? 1 : 0
  source                             = "./modules/aws_inspector_2"
  enabled_resources                  = var.enabled_resources
  auto_enable                        = var.auto_enable
  enable_delegated_admin_account     = var.enable_delegated_admin_account
  member_accounts                    = var.member_accounts
  admin_account_associate            = var.admin_account_associate
  enable_member_accounts             = var.enable_member_accounts
  initialize_delegated_admin_account = var.initialize_delegated_admin_account
}

