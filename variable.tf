variable "enabled_resources_member_account" {
  type    = list(string)
  default = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
}

variable "enabled_resources_admin_account" {
  type    = list(string)
  default = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
}

variable "auto_enable" {
  type    = list(string)
  default = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
}

variable "auto_enable_member_accounts" {
  type        = bool
  default     = false
  description = "Auto enable member account for the resources after adding"
}

variable "enable_delegated_admin_account" {
  type        = bool
  default     = false
  description = "Set to true if you want to enable inspector for the admin account"
}

variable "member_accounts" {
  type        = list(string)
  default     = []
  description = "Member accounts"
}

variable "account_associate" {
  type        = string
  default     = null
  description = "ID of account to associate"
}

variable "enable_account_associate" {
  type        = bool
  default     = false
  description = "Enable member account association"
}

variable "enable_member_accounts" {
  type        = bool
  default     = false
  description = "Enable inspector for member accounts"
}

variable "initialize_delegated_admin_account" {
  type        = bool
  default     = false
  description = "Enable delegated admin accounts"
}

variable "aws_inspector_2_enable" {
  type        = bool
  default     = false
  description = "Enable Inspector2 for this account"
}
