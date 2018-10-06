resource "aws_kms_key" "kms_key" {
  description             = "KMS master key for ${var.application_name}-${var.client_name}-${var.environment_name}"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  enable_key_rotation     = "${var.enable_key_rotation}"

    tags {
    ClientName    = "${var.client_name}"
    Environment   = "${var.environment_name}"
    Application   = "${var.application_name}"
    Billing       = "${var.billing}"
    Terraform     = "${var.terraform_tag}"
  }
}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/${var.application_name}-${var.client_name}-${var.environment_name}-master-key"
  target_key_id = "${aws_kms_key.kms_key.id}"
}