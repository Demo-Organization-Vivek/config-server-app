owner_team     = "DoubleDigitTeam"
default_region = "us-east-1"

component_name = "config-server"
ecs_task_mode  = "bridge"

service_desired_count = 2
service_launch_type   = "EC2"

default_target_group_port = 9001
