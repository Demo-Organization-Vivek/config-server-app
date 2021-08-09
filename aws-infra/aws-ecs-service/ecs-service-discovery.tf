resource "aws_service_discovery_service" "health_check_custom" {
  count = length(var.service_discovery) > 0 && length(var.service_discovery_health_check_config) == 0 && length(var.service_discovery_health_check_custom_config) > 0 ? 1 : 0

  name = local.namespace_name

  dns_config {
    namespace_id = local.namespace_id

    dns_records {
      ttl  = local.dns_ttl
      type = local.dns_type
    }

    routing_policy = local.dns_routing_policy
  }

  dynamic "health_check_custom_config" {
    for_each = [var.service_discovery_health_check_custom_config]
    content {
      failure_threshold = lookup(health_check_custom_config.value, "failure_threshold", null)
    }
  }
}

