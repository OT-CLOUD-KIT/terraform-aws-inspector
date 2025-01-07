# AWS Inspector Terraform Modules

This repository contains Terraform modules for configuring both AWS Inspector Classic and AWS Inspector 2. The modules are designed to simplify the setup and management of Amazon Inspector resources in your AWS account.

## Table of Contents
- [Modules](#modules)
- [Variables](#variables)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Provider Version Constraints](#provider-version-constraints)
- [Usage](#usage)

---

## Modules

### AWS Inspector Classic
The module for AWS Inspector Classic requires you to manually start assessments from the AWS Management Console. It creates resources such as assessment targets and templates for EC2 instances tagged according to the provided resource group tags.

### AWS Inspector 2
The module for AWS Inspector 2 enables delegation of administrative access, member account configuration, and auto-enablement for selected resource types.

---

## Variables

### Inputs for AWS Inspector Classic

| Name                | Type        | Default        | Description                                                         |
|---------------------|-------------|----------------|---------------------------------------------------------------------|
| `aws_inspector_classic_enable` | `bool`      | `false`       | Enable AWS Inspector Classic module.                                |
| `resource_group_tags` | `map(string)` | `{}`         | Tags for grouping resources in AWS Inspector Classic.               |
| `duration`          | `number`    | `3600`         | Duration (in seconds) for assessments in AWS Inspector Classic.     |
| `event`             | `string`    | `ASSESSMENT_RUN_STARTED` | Event type for SNS notifications in AWS Inspector Classic.          |

### Inputs for AWS Inspector 2

| Name                                | Type        | Default                                | Description                                                         |
|-------------------------------------|-------------|----------------------------------------|---------------------------------------------------------------------|
| `aws_inspector_2_enable`           | `string`    | `true`                                | Enable AWS Inspector 2 module.                                      |
| `enabled_resources_admin_account`  | `list(string)` | `["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]` | Resources enabled for the admin account in AWS Inspector 2.         |
| `enabled_resources_member_account` | `list(string)` | `["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]` | Resources enabled for member accounts in AWS Inspector 2.           |
| `auto_enable`                      | `list(string)` | `["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]` | Resources to auto-enable in AWS Inspector 2.                        |
| `auto_enable_member_accounts`      | `bool`      | `false`                               | Auto-enable resources for member accounts.                          |
| `enable_delegated_admin_account`   | `bool`      | `false`                               | Enable AWS Inspector 2 for the admin account.                       |
| `member_accounts`                  | `list(string)` | `[]`                                 | List of member account IDs.                                         |
| `account_associate`                | `number`    | `null`                                | ID of the account to associate.                                     |
| `enable_account_associate`         | `bool`      | `false`                               | Enable account association in AWS Inspector 2.                      |
| `enable_member_accounts`           | `bool`      | `false`                               | Enable AWS Inspector 2 for member accounts.                         |
| `initialize_delegated_admin_account`| `bool`     | `false`                               | Enable delegation of admin accounts in AWS Inspector 2.             |

### Outputs

#### Outputs for AWS Inspector Classic

No outputs are defined in the AWS Inspector Classic module.

#### Outputs for AWS Inspector 2

No outputs are defined in the AWS Inspector 2 module.

---

## Provider Version Constraints

| Provider Name       | Version Constraint | Current Version |
| ------------------- | ------------------ | --------------- |
| `aws`              | `>= 5.0.0`         | `5.82.0`        |
| `terraform`        | `>= 1.5.0`         | `1.9.6`         |

---

## Usage

Below are example configurations for using the modules:

### AWS Inspector Classic

module "aws_inspector_classic" {
  source              = "./modules/aws_inspector_classic"
  aws_inspector_classic_enable = true
  resource_group_tags = { "Name" = "Inspector_check" }
  event               = "ASSESSMENT_RUN_STARTED"
  duration            = 3600
}


### AWS Inspector 2
module "aws_inspector_2" {
  source                             = "./modules/aws_inspector_2"
  aws_inspector_2_enable             = true
  initialize_delegated_admin_account = true
  enable_delegated_admin_account     = true
  enabled_resources_admin_account    = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]
  enable_member_accounts             = true
  member_accounts                    = ["123456789012", "987654321098"]
  enabled_resources_member_account   = ["EC2", "ECR", "LAMBDA"]
  auto_enable                        = ["EC2", "ECR"]
  enable_account_associate           = true
  account_associate                  = 123456789012
}


---

For more information on configuring Amazon Inspector, refer to the [AWS Documentation](https://docs.aws.amazon.com/inspector/latest/userguide/).

