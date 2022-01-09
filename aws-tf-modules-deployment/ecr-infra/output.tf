output "ecr_repository_name" {
  value       = module.config-server-ecr-repo.ecr_repository_name
  description = "ECR Registry name"
}

output "ecr_registry_id" {
  value       = module.config-server-ecr-repo.ecr_registry_id
  description = "ECR Registry ID"
}

output "ecr_registry_url" {
  value       = module.config-server-ecr-repo.ecr_registry_url
  description = "ECR Registry URL"
}


output "role_arn" {
  value = module.config-server-ecr-repo.role_arn
}
