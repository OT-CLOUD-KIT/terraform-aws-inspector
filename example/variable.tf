variable "aws_region" {
  default     = "us-east-1"
  description = "Region to deploy"
}


variable "aws_inspector_2_enable" {
  type    = bool
  default = true
}

variable "initialize_delegated_admin_account" {
  type    = bool
  default = false
}

variable "enable_delegated_admin_account" {
  type    = bool
  default = false
}




variable "enabled_resources_admin_account" {
  type    = list(string)
  default = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
  validation {
    condition     = alltrue([for i in var.enabled_resources_admin_account : contains(["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"], i)])
    error_message = "Only EC2, ECR, LAMBDA, and LAMBDA_CODE are valid."
  }
}

variable "enable_member_accounts" {
  type    = bool
  default = false
}

variable "member_accounts" {
  type    = list(string)
  default = []
}

variable "enabled_resources_member_account" {
  type    = list(string)
  default = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
  validation {
    condition     = alltrue([for i in var.enabled_resources_member_account : contains(["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"], i)])
    error_message = "Only EC2, ECR, LAMBDA, and LAMBDA_CODE are valid."
  }
}

variable "auto_enable" {
  type    = list(string)
  default = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
  validation {
    condition     = alltrue([for i in var.auto_enable : contains(["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"], i)])
    error_message = "Only EC2, ECR, LAMBDA, and LAMBDA_CODE are valid."
  }
}

variable "auto_enable_member_accounts" {
  type    = bool
  default = false
}

variable "enable_account_associate" {
  type    = bool
  default = false
}

variable "account_associate" {
  type    = string
  default = null
}