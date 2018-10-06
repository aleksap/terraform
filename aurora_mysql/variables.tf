#taking out variable azs because it's messing up with availability zones were nodes are sent. 
#if it's out it will spread units according to subnet_group attached to it. 

#variable "azs" {
#  type        = "list"
#  description = "A list of Availability Zones in the Region"
#}

variable "database_name" {}
variable "master_username" {}
variable "master_password" {}

variable "engine" {
  default = "aurora"
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = "30"
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created"
  default     = "01:00-03:00"
}

variable "preferred_maintenance_window" {
  description = "The preferred window for maintenance"
  default     = "sun:09:00-sun:11:00"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  default     = []
}

variable "storage_encrypted" {
  default = true
}

variable "apply_immediately" {
  default = true
}

variable "db_subnet_group_name" {}
variable "db_cluster_parameter_group" {}

variable "iam_database_authentication_enabled" {
  default = false
}

variable "cluster_size" {
  description = "Number of cluster instances to create"
}

variable "instance_class" {
  description = "Instance class to use when creating RDS cluster"
  default     = "db.t2.medium"
}

variable "publicly_accessible" {
  description = "Should the instance get a public IP address?"
  default     = "false"
}

variable "db_parameter_group" {}

#tags
variable "client_name" {}

variable "environment_name" {}
variable "application_name" {}
variable "billing" {}

variable "terraform_tag" {
  default = true
}
