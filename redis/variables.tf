#variable "cluster_id" {}

variable "vpc_id" {}

variable "redis_secgrp" {}

variable "instance_number" {}

#variable "private_subnet_ids" {}

variable "redis_subnet_group_name" {}

variable "num_cache_nodes" {}

variable "engine_version" {
  default = "3.2.6"
}

variable "parameter_group_name" {
  default = "default.redis3.2"
}

variable "instance_type" {
  default = "cache.m3.medium"
}

variable "maintenance_window" {
  # SUN 01:00AM-02:00AM ET
  default = "sun:05:00-sun:06:00"
}

# tags
variable "client_name" {}
variable "environment_name" {}
variable "application_name" {}
variable "terraform_tag" {
     default = true
}
variable "billing" {}
