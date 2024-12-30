/*variable "aws_terraform_role" {
  type        = string
  description = "ARN of the AWS role to assume for Terraform operations."
  validation {
    condition     = startswith(var.aws_terraform_role, "arn")
    error_message = "Must be a valid AWS role ARN."
  }
}*/

/*variable "terraform_session" {
  type        = string
  description = "Session name for Terraform AWS provider."
}*/
variable "aws_region" {
  default     = "ap-south-1"
  type        = string
  description = "AWS region selected"
}
variable "aws_inspector_classic_enable" {
  type    = bool
  default = true
}

variable "aws_inspector_2_enable" {
  default = true
  type    = string
}

## Amazon Inspector 2 required variable 
variable "enabled_resources" {
  type    = list(string)
  default = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
  validation {
    condition     = alltrue([for i in var.enabled_resources : contains(["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"], i)])
    error_message = "Can only conatin one or more of the following resources EC2,ECR,LAMBDA and LAMBDA_CODE"
  }
}

variable "auto_enable" {
  type    = list(string)
  default = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
  validation {
    condition     = alltrue([for i in var.auto_enable : contains(["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"], i)])
    error_message = "Can only conatin one or more of the following resources EC2,ECR,LAMBDA and LAMBDA_CODE"
  }
}

variable "enable_delegated_admin_account" {
  type        = bool
  default     = true
  description = "Set to true if you eant to enable inspector for the admin account"
}

variable "member_accounts" {
  type        = list(string)
  default     = [""]
  description = "Member accounts"
}

variable "admin_account_associate" {
  default     = null
  type        = number
  description = "Value of admin account to associate with"
}

variable "enable_member_accounts" {
  type        = bool
  default     = false
  description = "If you want to enable inspector for memeber accounts"
}

variable "initialize_delegated_admin_account" {
  type        = bool
  default     = false
  description = "Enable delegated admin accounts"
}

## Amazon inspector classic required variable
variable "duration" {
  default     = 3600
  type        = number
  description = "Time duration for the assessment to run to"
}

variable "event" {
  type    = string
  default = "ASSESSMENT_RUN_STARTED"
  validation {
    condition     = contains(["ASSESSMENT_RUN_STARTED", "ASSESSMENT_RUN_COMPLETED", "ASSESSMENT_RUN_STATE_CHANGED", "FINDING_REPORTED"], var.event)
    error_message = "Please provide the valid value."
  }
}

variable "resource_group_tags" {
  type        = map(string)
  default     = {}
  description = "Tag values required to group your resources given to the resource group."
}

variable "Terraform_role" {
  type = string
  description = "Role to be assumed by terraform"
}
