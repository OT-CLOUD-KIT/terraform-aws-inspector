# AWS Inspector Modules

This configuration provides an example of using two modules: `aws_inspector_classic` and `aws_inspector_2`. Each module enables and configures AWS Inspector services depending on the specified variables.

## Modules

### 1. **AWS Inspector Classic**
This module configures AWS Inspector Classic based on the provided input variables.

#### Variables:
- **`aws_inspector_classic_enable`** (Boolean):
  - Determines whether the `aws_inspector_classic` module is enabled.
  - Default: `true`

- **`resource_group_tags`** (Map):
  - Tags to be applied to the resource group created for AWS Inspector Classic.
  - Default: `{}`

- **`event`** (String):
  - Event details for the AWS Inspector Classic.
  - Allowed values: `ASSESSMENT_RUN_STARTED`, `ASSESSMENT_RUN_COMPLETED`, `ASSESSMENT_RUN_STATE_CHANGED`, `FINDING_REPORTED`
  - Default: `ASSESSMENT_RUN_STARTED`

- **`duration`** (Number):
  - Duration for which the AWS Inspector Classic assessment will run (in seconds).
  - Default: `3600`

### 2. **AWS Inspector 2**
This module configures AWS Inspector 2 based on the provided input variables.

#### Variables:
- **`aws_inspector_2_enable`** (String):
  - Determines whether the `aws_inspector_2` module is enabled.
  - Default: `true`

- **`enabled_resources`** (List):
  - List of resource ARNs to enable for AWS Inspector 2.
  - Allowed values: `EC2`, `ECR`, `LAMBDA`, `LAMBDA_CODE`
  - Default: `["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]`

- **`auto_enable`** (List):
  - Resources to be auto-enabled for AWS Inspector 2.
  - Allowed values: `EC2`, `ECR`, `LAMBDA`, `LAMBDA_CODE`
  - Default: `["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]`

- **`enable_delegated_admin_account`** (Boolean):
  - Enables the configuration of a delegated admin account for AWS Inspector 2.
  - Default: `true`

- **`member_accounts`** (List):
  - List of member account IDs to include in the AWS Inspector 2 configuration.
  - Default: `[]`

- **`admin_account_associate`** (Number):
  - Value of the admin account to associate with AWS Inspector 2.
  - Default: `null`

- **`enable_member_accounts`** (Boolean):
  - Enables member accounts for AWS Inspector 2.
  - Default: `false`

- **`initialize_delegated_admin_account`** (Boolean):
  - Determines if the delegated admin account should be initialized for AWS Inspector 2.
  - Default: `false`

### Common Variables

- **`aws_region`** (String):
  - AWS region selected for deployment.
  - Default: `ap-south-1`

- **`aws_terraform_role`** (String):
  - ARN of the AWS role to assume for Terraform operations.
  - Must start with `arn`.

- **`terraform_session`** (String):
  - Session name for Terraform AWS provider.

## Usage

### Enabling AWS Inspector Classic
To enable AWS Inspector Classic, set the `aws_inspector_classic_enable` variable to `true`. Example:

```hcl
variable "aws_inspector_classic_enable" {
  default = true
}
```

### Enabling AWS Inspector 2
To enable AWS Inspector 2, set the `aws_inspector_2_enable` variable to `true`. Example:

```hcl
variable "aws_inspector_2_enable" {
  default = true
}
```

### Example Implementation
```hcl
module "aws_inspector_classic" {
  count               = var.aws_inspector_classic_enable == true ? 1 : 0
  source              = "./modules/aws_inspector_classic"
  resource_group_tags = { "Name" = "Inspector_check" }
  event               = var.event
  duration            = var.duration
}

module "aws_inspector_2" {
  count                              = var.aws_inspector_2_enable == true ? 1 : 0
  source                             = "./modules/aws_inspector_2"
  enabled_resources                  = var.enabled_resources
  auto_enable                        = var.auto_enable
  enable_delegated_admin_account     = var.enable_delegated_admin_account
  member_accounts                    = var.member_accounts
  admin_account_associate            = var.admin_account_associate
  enable_member_accounts             = var.enable_member_accounts
  initialize_delegated_admin_account = var.initialize_delegated_admin_account
}
```

## Notes
- Ensure the necessary permissions are in place for the modules to create and configure AWS Inspector services.
- Review the variables and set appropriate values before applying the configuration.
- Use `terraform plan` to preview changes before applying them.

