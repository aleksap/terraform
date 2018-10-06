variable "family" {}

variable "db_parameters" {
  description = "A list of cluster parameter maps to apply"
  type        = "list"
  default     = []
}

variable "client_name" {}
variable "environment_name" {}
variable "application_name" {}
variable "billing" {}

variable "terraform_tag" {
  default = true
}
