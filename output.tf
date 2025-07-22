output "caller_account_id" {
  value = data.aws_caller_identity.calling_account.id
}

output "inspector_admin_enabler_ids" {
  value = aws_inspector2_enabler.enable_inspector_admin_account[*].id
  description = "Inspector2 enabler IDs for the admin account"
}

output "inspector_member_enabler_ids" {
  value = aws_inspector2_enabler.enable_member_accounts[*].id
  description = "Inspector2 enabler IDs for member accounts"
}

output "delegated_admin_account_id" {
  value = aws_inspector2_delegated_admin_account.admin_account[*].id
  description = "Delegated admin account ID"
}

output "org_auto_enable_config" {
  value       = aws_inspector2_organization_configuration.example[*].id
  description = "Organization-wide auto-enable Inspector2 config"
}

output "member_association_account_id" {
  value       = aws_inspector2_member_association.example[*].account_id
  description = "Associated member account ID"
}