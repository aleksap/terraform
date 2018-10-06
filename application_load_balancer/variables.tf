variable "load_balancer_name" {
}

variable "load_balancer_is_internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  default     = false
}

variable "security_groups" {
  description = "The security groups to attach to the load balancer. e.g. [\"sg-edcd9784\",\"sg-edcd9785\"]"
  type        = "list"
}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = "list"
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  default     = 60
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  default     = false
}

variable "enable_http2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
  default     = true
}

variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  default     = "ipv4"
}


variable "target_group_name" {
}

variable "vpc_id" {
}

variable "backend_port" {
}

variable "backend_protocol" {
}

variable "health_check_interval" {
  default     = "10"
}

variable "health_check_path" {
}

variable "health_check_port" {
}

variable "health_check_healthy_threshold" {
  default     = "3"
}

variable "health_check_unhealthy_threshold" {
  default     = "10"
}

variable "health_check_timeout" {
  default     = "5"
}

variable "cookie_duration" {
  default     = "1800"
}

variable "stickiness_enabled" {
  default     = "true"
}

variable "lb_http_listener_port" {
  default     = "80"
}

variable "lb_https_listener_port" {
  default     = "443"
}

variable "listener_ssl_cert" {
}

variable "listener_ssl_policy" {
  default     = "ELBSecurityPolicy-2016-08"
}

variable "ec2_instance_id" {
  #default = []
  type        = "list"
}

variable "ec2_instance_port" {
}

variable "num_ec2_instances" {}

variable "tags" {
  default     = {}
}






