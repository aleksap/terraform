output "aurora_cluster_parameter_group" {
  value = "${aws_rds_cluster_parameter_group.aurora_cluster_parameter_group.id}"
}
