##################
# DB paramater group
##################
resource "aws_db_parameter_group" "aurora_parameter_group" {
  name        = "${var.application_name}-${var.client_name}-${var.environment_name}-db-parameter-group"
  family      = "${var.family}"
  description = "Terraform-managed parameter group for ${var.application_name}-${var.client_name}-${var.environment_name}"
  parameter   = ["${var.db_parameters}"]

  tags {
    Name        = "${var.application_name}-${var.client_name}-${var.environment_name}-db-parameter-group"
    ClientName  = "${var.client_name}"
    Environment = "${var.environment_name}"
    Application = "${var.application_name}"
    Billing     = "${var.billing}"
    Terraform   = "${var.terraform_tag}"
  }
}
