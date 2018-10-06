resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "${var.application_name}-${var.client_name}-${var.environment_name}-${var.instance_number}"
  engine               = "redis"
  engine_version       = "${var.engine_version}"
  maintenance_window   = "${var.maintenance_window}"
  node_type            = "${var.instance_type}"
  num_cache_nodes      = "${var.num_cache_nodes}"
  parameter_group_name = "${var.parameter_group_name}"
  port                 = "6379"
  subnet_group_name    = "${var.redis_subnet_group_name}"
  security_group_ids   = ["${var.redis_secgrp}"]
  
  tags {
    ClientName    = "${var.client_name}"
    Environment   = "${var.environment_name}"
    Application   = "${var.application_name}"
    Terraform     = "${var.terraform_tag}"
    Billing       = "${var.billing}"
  }
}
