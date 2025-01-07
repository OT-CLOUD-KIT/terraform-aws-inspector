output "assement_template_arn" {
  value       = aws_inspector_assessment_template.inspector_assessment_template.arn
  description = "Resource assesment Termplate"
}

output "resourceGroup" {
  value       = aws_inspector_resource_group.inspector_resource_group
  description = "Resource group of the assesmemnt"
}

output "assesment_target" {
  value       = aws_inspector_assessment_target.target_resources
  description = "Assesment target for the template"
}
