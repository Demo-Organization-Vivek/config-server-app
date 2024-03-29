variable "default_region" {
  type        = string
  description = "AWS region to deploy our resources"
}

variable "environment" {
  type        = string
  description = "Environment to be configured 'dev', 'qa', 'prod'"
}

variable "owner_team" {
  type        = string
  description = "Name of owner team"
}

variable "component" {
  type = string
  description = "Component name"
}

#################################
# ECR Variables                 #
#################################
variable "enabled" {
  type        = bool
  description = "True will allow to create ECR"
}

variable "repo_name" {
  type        = string
  description = "ECR repository name"
}

variable "max_image_count" {
  type        = number
  description = "Total number of images allowed in ECR"
}


####################################
# Local variables                  #
####################################
locals {
  common_tags = {
    owner       = "Vivek"
    team        = "LearningTeam"
    environment = var.environment
    component = "Config-Server"
  }
}