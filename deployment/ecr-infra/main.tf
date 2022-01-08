####################################################
#           ECR module deployment                  #
####################################################
module "config-server-ecr-repo" {
  source = "../../aws-tf-modules/module.ecr-infra"

  environment    = var.environment
  default_region = var.default_region
  owner_team = var.owner_team
  component = var.component

  enabled = var.enabled
  max_image_count = var.max_image_count
  repo_name = var.repo_name
}
