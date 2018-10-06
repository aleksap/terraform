resource "aws_elasticache_subnet_group" "default" {
  name        = "${var.application_name}-${var.environment_name}-redis"
  description = "${var.application_name}-${var.environment_name}-redis"
  subnet_ids  = ["${split(",", var.private_subnet_ids)}"]
  #tags        = "${var.tags}"
}

