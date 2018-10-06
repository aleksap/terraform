resource "aws_rds_cluster" "aurora" {
  cluster_identifier = "${var.application_name}-${var.client_name}-${var.environment_name}-cluster"

  #availability_zones              = ["${var.azs}"] #commenting this as it's causing issues 
  database_name                = "${var.database_name}"
  master_username              = "${var.master_username}"
  master_password              = "${var.master_password}"
  engine                       = "${var.engine}"
  backup_retention_period      = "${var.backup_retention_period}"
  preferred_maintenance_window = "${var.preferred_maintenance_window}"
  preferred_backup_window      = "${var.preferred_backup_window}"
  vpc_security_group_ids       = ["${var.vpc_security_group_ids}"]
  storage_encrypted            = "${var.storage_encrypted}"

  #kms_key_id                      = "${aws_kms_key.aurora.arn}"
  apply_immediately               = "${var.apply_immediately}"
  db_subnet_group_name            = "${var.db_subnet_group_name}"
  db_cluster_parameter_group_name = "${var.db_cluster_parameter_group}"
  final_snapshot_identifier       = "final-snapshot-${var.application_name}-${var.client_name}-${var.environment_name}" #

  #skip_final_snapshot                 = true # Useful in dev - defaults to false
  iam_database_authentication_enabled = "${var.iam_database_authentication_enabled}"

  tags {
    Name        = "${var.application_name}-${var.client_name}-${var.environment_name}-cluster"
    ClientName  = "${var.client_name}"
    Environment = "${var.environment_name}"
    Application = "${var.application_name}"
    Billing     = "${var.billing}"
    Terraform   = "${var.terraform_tag}"
  }

  lifecycle {
    prevent_destroy = "false" # https://www.terraform.io/docs/configuration/resources.html#prevent_destroy
  }
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count                   = "${var.cluster_size}"
  identifier              = "${var.application_name}-${var.client_name}-${var.environment_name}-rds-${count.index}"
  engine                  = "${var.engine}"
  cluster_identifier      = "${aws_rds_cluster.aurora.id}"
  instance_class          = "${var.instance_class}"
  publicly_accessible     = "${var.publicly_accessible}"
  db_subnet_group_name    = "${var.db_subnet_group_name}"
  db_parameter_group_name = "${var.db_parameter_group}"
  apply_immediately       = "${var.apply_immediately}"

  # monitoring_role_arn     = "${aws_iam_role.aurora_instance_role.arn}" #The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs in case we need it. Too much work for now, leaving it out and will revisit. 
  # monitoring_interval     = "5"

  tags {
    Name        = "${var.application_name}-${var.client_name}-${var.environment_name}-rds-${count.index}"
    ClientName  = "${var.client_name}"
    Environment = "${var.environment_name}"
    Application = "${var.application_name}"
    Billing     = "${var.billing}"
    Terraform   = "${var.terraform_tag}"
  }
}

/*


resource "aws_iam_role" "aurora_instance_role" {
  name               = "tf-role-rds-${var.name}-${data.aws_vpc.vpc.tags["Name"]}"
  assume_role_policy = "${file("${path.module}/files/iam/assume_role_rds_monitoring.json")}"
  path               = "/tf/${var.env}/${var.name}-${data.aws_vpc.vpc.tags["Name"]}/"        # edits?
}

resource "aws_iam_role_policy_attachment" "aurora_policy_rds_monitoring" {
  role       = "${aws_iam_role.aurora_instance_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}
*/

