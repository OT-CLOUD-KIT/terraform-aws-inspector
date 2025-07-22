aws_region = "us-east-1"

aws_inspector_2_enable = true

enabled_resources_admin_account = ["EC2", "ECR"]

initialize_delegated_admin_account = false
enable_delegated_admin_account     = false

enable_member_accounts           = false
member_accounts                  = []
enabled_resources_member_account = []

auto_enable                 = []
auto_enable_member_accounts = false

enable_account_associate = false
account_associate        = null