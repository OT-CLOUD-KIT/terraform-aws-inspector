# Terraform AWS Inspector 2

A Terraform module to configure **Amazon Inspector 2** for continuous vulnerability scanning across AWS workloads. Supports EC2, ECR, and Lambda scanning in single-account or organization setups.

---

## Architecture

![Inspectore2](https://github.com/user-attachments/assets/28be3167-e1a4-47e5-91fa-5f333df2607f)

> **Note:**  
> The diagram above represents a basic Inspector 2 setup. This module supports advanced configurations such as delegated admin setup, member account scanning, and organization-wide auto-enable features.

---


## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1|

___

## Usage

module "aws_inspector_2" {
  source = "OT-CLOUD-KIT/terraform-aws-inspector"

  aws_inspector_2_enable           = true
  enabled_resources_admin_account  = ["EC2", "ECR"]

  initialize_delegated_admin_account = false
  enable_delegated_admin_account     = false

  enable_member_accounts           = false
  member_accounts                  = []
  enabled_resources_member_account = []

  auto_enable                 = []
  auto_enable_member_accounts = false

  enable_account_associate = false
  account_associate        = null
}


 ## Resources
| Name                                                                                                                                                              | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws\_caller\_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                                           | Data Source |
| [aws\_inspector2\_delegated\_admin\_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_delegated_admin_account)      | Resource    |
| [aws\_inspector2\_enabler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_enabler)                                        | Resource    |
| [aws\_inspector2\_organization\_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_organization_configuration) | Resource    |
| [aws\_inspector2\_member\_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_member_association)                 | Resource    |


___

## Input

| Name                                                                                                                                       | Description                                                                                                      | Type           | Default          | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- | -------------- | ---------------- | :------: |
| <a name="input_aws_region"></a> [aws\_region](#input_aws_region)                                                                           | AWS region where Inspector 2 will be configured                                                                  | `string`       | `"us-east-1"`    |    no    |
| <a name="input_aws_inspector_2_enable"></a> [aws\_inspector\_2\_enable](#input_aws_inspector_2_enable)                                     | Whether to enable Inspector 2 for the current account                                                            | `bool`         | `true`           |    no    |
| <a name="input_enabled_resources_admin_account"></a> [enabled\_resources\_admin\_account](#input_enabled_resources_admin_account)          | List of resource types (e.g., EC2, ECR) to enable in the admin account                                           | `list(string)` | `["EC2", "ECR"]` |    no    |
| <a name="input_initialize_delegated_admin_account"></a> [initialize\_delegated\_admin\_account](#input_initialize_delegated_admin_account) | Whether to initialize this account as the delegated admin                                                        | `bool`         | `false`          |    no    |
| <a name="input_enable_delegated_admin_account"></a> [enable\_delegated\_admin\_account](#input_enable_delegated_admin_account)             | Whether to enable a delegated admin account                                                                      | `bool`         | `false`          |    no    |
| <a name="input_enable_member_accounts"></a> [enable\_member\_accounts](#input_enable_member_accounts)                                      | Whether to enable Inspector 2 for member accounts                                                                | `bool`         | `false`          |    no    |
| <a name="input_member_accounts"></a> [member\_accounts](#input_member_accounts)                                                            | List of AWS account IDs to enable Inspector 2 for as members                                                     | `list(string)` | `[]`             |    no    |
| <a name="input_enabled_resources_member_account"></a> [enabled\_resources\_member\_account](#input_enabled_resources_member_account)       | List of resource types (e.g., EC2, ECR) to enable in member accounts                                             | `list(string)` | `[]`             |    no    |
| <a name="input_auto_enable"></a> [auto\_enable](#input_auto_enable)                                                                        | List of resource types to automatically enable for future member accounts (e.g., EC2, ECR, LAMBDA, LAMBDA\_CODE) | `list(string)` | `[]`             |    no    |
| <a name="input_auto_enable_member_accounts"></a> [auto\_enable\_member\_accounts](#input_auto_enable_member_accounts)                      | Whether to enable Inspector 2 by default for all new member accounts                                             | `bool`         | `false`          |    no    |
| <a name="input_enable_account_associate"></a> [enable\_account\_associate](#input_enable_account_associate)                                | Whether to associate a single member account manually                                                            | `bool`         | `false`          |    no    |
| <a name="input_account_associate"></a> [account\_associate](#input_account_associate)                                                      | AWS Account ID to manually associate as a member                                                                 | `string`       | `null`           |    no    |

___

## Output

| Name                                                                                                                       | Description                                                       |
| -------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| <a name="output_inspector_enabled_admin_ids"></a> [inspector\_enabled\_admin\_ids](#output_inspector_enabled_admin_ids)    | IDs of the resources enabled for Inspector 2 in the admin account |
| <a name="output_inspector_enabled_member_ids"></a> [inspector\_enabled\_member\_ids](#output_inspector_enabled_member_ids) | IDs of the resources enabled for Inspector 2 in member accounts   |
| <a name="output_delegated_admin_id"></a> [delegated\_admin\_id](#output_delegated_admin_id)                                | Account ID of the delegated administrator                         |
| <a name="output_organization_auto_enabled"></a> [organization\_auto\_enabled](#output_organization_auto_enabled)           | Inspector 2 organization-level auto-enable configuration          |
| <a name="output_associated_member_account_id"></a> [associated\_member\_account\_id](#output_associated_member_account_id) | ID of the manually associated member account                      |
| <a name="output_caller_account"></a> [caller\_account](#output_caller_account)                                             | Account ID of the caller using this module                        |

___

## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)

