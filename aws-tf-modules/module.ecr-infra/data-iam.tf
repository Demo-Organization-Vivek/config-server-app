data "aws_iam_policy_document" "ecr_access_policy" {
  count = var.enabled ? 1 : 0

  statement {
    sid    = "AllowPushPull"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = ["*"]
    }

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy",
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage"
    ]
  }
}

# used for accessing Account ID and ARN
data "aws_caller_identity" "current" {}

locals {
  common_arns = {
    role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/JenkinsSlavesRole"
  }
}
