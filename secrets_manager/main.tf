resource "aws_secretsmanager_secret" "secret_key" {
  name          = "${var.application_name}-${var.client_name}-${var.environment_name}-${var.secret_name}"
  description   = "Secret manager for ${var.application_name}-${var.client_name}-${var.environment_name}"
  kms_key_id    = "${var.kms_key_id}"
  

  tags {
    Name          = "${var.application_name}-${var.client_name}-${var.environment_name}-${var.secret_name}"
    ClientName    = "${var.client_name}"
    Environment   = "${var.environment_name}"
    Application   = "${var.application_name}"
    Billing       = "${var.billing}"
    Terraform     = "${var.terraform_tag}"
  }
}

resource "aws_secretsmanager_secret_version" "secret_key_version" {
  secret_id       = "${aws_secretsmanager_secret.secret_key.id}"
  secret_string = "${jsonencode(var.my_map)}"
}