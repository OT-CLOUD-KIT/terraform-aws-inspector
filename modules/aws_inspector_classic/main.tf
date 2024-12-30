##Capturing the data arns of the region for the rules
data "aws_inspector_rules_packages" "rules" {}

##Creating resource group in accordance with the tags fivemn to the ec2 resources.

resource "aws_inspector_resource_group" "inspector_resource_group" {
  count = length(var.resource_group_tags) == 0 ? 0 : 1
  tags  = var.resource_group_tags
}

#IAM poliocy documenmt for the sns queue

data "aws_iam_policy_document" "sns_log_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]
    resources = ["*"]
  }
}


## Assume role policy required by ther sts for the role

data "aws_iam_policy_document" "sns_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "sns_cloudwatch_role" {
  name               = "sns_role_cloudwatch_successDelivery"
  assume_role_policy = data.aws_iam_policy_document.sns_assume_role.json
}

resource "aws_iam_role_policy" "iam_policy_sns" {
  name   = "iam_sns_cloudwatch_policy"
  policy = data.aws_iam_policy_document.sns_log_policy_document.json
  role   = aws_iam_role.sns_cloudwatch_role.name
}

##IAM policy document for allresources to access the topic

data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = ["*"]

    sid = "__default_statement_ID"
  }
}

##Creating sns queue
resource "aws_sns_topic" "inspector_event" {
  name                                  = "inspector_event"
  policy                                = data.aws_iam_policy_document.sns_topic_policy.json
  application_success_feedback_role_arn = aws_iam_role.sns_cloudwatch_role.arn
  application_failure_feedback_role_arn = aws_iam_role.sns_cloudwatch_role.arn
}

## Assessment template
resource "aws_inspector_assessment_template" "inspector_assessment_template" {
  name       = "inspector_assessment_template"
  target_arn = aws_inspector_assessment_target.target_resources.arn
  duration   = var.duration

  rules_package_arns = data.aws_inspector_rules_packages.rules.arns

  event_subscription {
    event     = var.event
    topic_arn = aws_sns_topic.inspector_event.arn
  }
}

## Assessment target 

resource "aws_inspector_assessment_target" "target_resources" {
  name               = "assessment target"
  resource_group_arn = length(var.resource_group_tags) == 0 ? null : aws_inspector_resource_group.inspector_resource_group[0].arn
}
