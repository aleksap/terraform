#variable "description" {}
variable "deletion_window_in_days" {
  default = 30
}
variable "enable_key_rotation" {
  default = false
}
variable "client_name" {}
variable "environment_name" {}
variable "application_name" {}
variable "billing" {}
variable "terraform_tag" {
     default = true
   }
