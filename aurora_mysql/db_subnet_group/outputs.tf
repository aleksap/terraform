# DB subnet group
output "aurora_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = "${element(concat(aws_db_subnet_group.aurora_subnet_group.*.id, list("")), 0)}"
}

output "aurora_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = "${element(concat(aws_db_subnet_group.aurora_subnet_group.*.arn, list("")), 0)}"
}
