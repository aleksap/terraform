##################
# DB subnet group
##################
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name        = "${var.application_name}-${var.client_name}-${var.environment_name}-${var.subnet_group_type}-subnet-group"
  description = "Database subnet group for ${var.application_name}-${var.client_name}-${var.environment_name}"
  subnet_ids  = ["${var.subnet_ids}"]

  tags {
    Subnet_group_type = "${var.subnet_group_type}"
    Name              = "${var.application_name}-${var.client_name}-${var.environment_name}-${var.subnet_group_type}-subnet-group"
    ClientName        = "${var.client_name}"
    Environment       = "${var.environment_name}"
    Application       = "${var.application_name}"
    Billing           = "${var.billing}"
    Terraform         = "${var.terraform_tag}"
  }
}
