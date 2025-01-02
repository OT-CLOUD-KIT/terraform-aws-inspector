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
  initialize_delegated_admin_account = var.initialize_delegated_admin_account == true ? true : null
  enable_delegated_admin_account     = var.enable_delegated_admin_account == true ? true : null
  enabled_resources_admin_account    = var.enable_delegated_admin_account == true ? var.enabled_resources_admin_account : null
  enable_member_accounts             = var.enable_member_accounts == true ? true : null
  member_accounts                    = var.enable_member_accounts == true ? var.member_accounts : null
  enabled_resources_member_account   = var.enable_member_accounts == true ? var.enabled_resources_member_account : null
  auto_enable                        = var.auto_enable
  enable_account_associate           = var.enable_account_associate == true ? true : null
  account_associate                  = var.enable_account_associate == true ? var.account_associate : null
}