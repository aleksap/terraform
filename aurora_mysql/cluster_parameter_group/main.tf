##################
# Cluster paramater group
##################
resource "aws_rds_cluster_parameter_group" "aurora_cluster_parameter_group" {
  name        = "${var.application_name}-${var.client_name}-${var.environment_name}-cluster-parameter-group"
  family      = "${var.family}"
  description = "Terraform-managed parameter group for ${var.application_name}-${var.client_name}-${var.environment_name}"
  parameter   = ["${var.cluster_parameters}"]

  tags {
    Name        = "${var.application_name}-${var.client_name}-${var.environment_name}-cluster-parameter-group"
    ClientName  = "${var.client_name}"
    Environment = "${var.environment_name}"
    Application = "${var.application_name}"
    Billing     = "${var.billing}"
    Terraform   = "${var.terraform_tag}"
  }
}
