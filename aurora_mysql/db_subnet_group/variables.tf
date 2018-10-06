variable "subnet_ids" {
  type        = "list"
  description = "A list of VPC subnet IDs"
  default     = []
}

variable "subnet_group_type" {
  description = "Use private/public so we can use it for naming convention"
}

variable "client_name" {}
variable "environment_name" {}
variable "application_name" {}
variable "billing" {}

variable "terraform_tag" {
  default = true
}
