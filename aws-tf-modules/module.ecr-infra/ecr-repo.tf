resource "aws_ecr_repository" "config_server_app_ecr" {
  count = var.enabled ? 1 : 0

  name = var.repo_name
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(local.common_tags, tomap({"Name" = "config-server-ecr-repo"}))

}

resource "aws_ecr_lifecycle_policy" "config_server_lifecycle" {
  count      = var.enabled ? 1 : 0
  repository = join("", aws_ecr_repository.config_server_app_ecr.*.name)

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Remove untagged images",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 1
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Rotate images when reach ${var.max_image_count} images stored",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": ${var.max_image_count}
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

resource "aws_ecr_repository_policy" "config_server_app_ecr_policy" {
  depends_on = [data.aws_iam_policy_document.ecr_access_policy]

  repository = join("", aws_ecr_repository.config_server_app_ecr.*.name)
  policy     = join("", data.aws_iam_policy_document.ecr_access_policy.*.json)
}
