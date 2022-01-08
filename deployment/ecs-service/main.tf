####################################################
#           ECS Service module deployment          #
####################################################
module "config_server_ecs_service" {
  source = "../../aws-tf-modules/module.ecs-service"

  environment    = var.environment
  default_region = var.default_region
  owner_team = var.owner_team

  component_name = var.component_name
  default_target_group_port = var.default_target_group_port
  ecs_task_mode = var.ecs_task_mode
  service_desired_count = var.service_desired_count
  service_launch_type = var.service_launch_type
}
