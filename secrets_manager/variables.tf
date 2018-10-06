variable "my_map" {
  type = "map"
  }
variable "kms_key_id" {}
#tags
variable "client_name" {}
variable "environment_name" {}
variable "application_name" {}
variable "secret_name" {}
variable "billing" {}
variable "terraform_tag" {
     default = true
   }