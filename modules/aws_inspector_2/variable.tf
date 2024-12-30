variable "enabled_resources" {
  type = list(string)
  default = ["EC2","ECR","LAMBDA","LAMBDA_CODE"]
}

variable "auto_enable" {
  type = list(string)
  default = ["EC2","ECR","LAMBDA","LAMBDA_CODE"]
}

variable "enable_delegated_admin_account" {
  type = bool
  default = true
  description = "Set to true if you eant to enable inspector for the admin account"
}

variable "member_accounts" {
  type = list(string)
  default = [""]
  description = "Member accounts"
}

variable "admin_account_associate" {
  default = null
  type = number
  description = "Value of admin account to associate with"
}

variable "enable_member_accounts" {
  type = bool
  default = false
  description = "If you want to enable inspector for memeber accounts"
}

variable "initialize_delegated_admin_account" {
  type = bool
  default = false
  description = "Enable delegated admin accounts"
}

