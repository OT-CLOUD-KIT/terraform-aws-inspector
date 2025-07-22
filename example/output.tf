output "inspector_enabled_admin_ids" {
  value = module.aws_inspector_2.inspector_admin_enabler_ids
}

output "inspector_enabled_member_ids" {
  value = module.aws_inspector_2.inspector_member_enabler_ids
}

output "delegated_admin_id" {
  value = module.aws_inspector_2.delegated_admin_account_id
}

output "organization_auto_enabled" {
  value = module.aws_inspector_2.org_auto_enable_config
}

output "associated_member_account_id" {
  value = module.aws_inspector_2.member_association_account_id
}

output "caller_account" {
  value = module.aws_inspector_2.caller_account_id
}