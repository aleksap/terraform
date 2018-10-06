output "name" {
  value       = "${join("", aws_rds_cluster.aurora.*.database_name)}"
  description = "Database name"
}

output "user" {
  value       = "${join("", aws_rds_cluster.aurora.*.master_username)}"
  description = "Username for the master DB user"
}

output "password" {
  value       = "${join("", aws_rds_cluster.aurora.*.master_password)}"
  description = "Password for the master DB user"
  sensitive   = true
}

output "cluster_name" {
  value       = "${join("", aws_rds_cluster.aurora.*.cluster_identifier)}"
  description = "Cluster Identifier"
}

output "cluster_endpoint" {
  value       = "${join("", aws_rds_cluster.aurora.*.endpoint)}"
  description = "Cluster Identifier"
}

output "port" {
  value       = "${join("", aws_rds_cluster.aurora.*.port)}"
  description = "port"
}

output "cluster_readonly_endpoint" {
  value       = "${join("", aws_rds_cluster.aurora.*.reader_endpoint)}"
  description = "Cluster read-only endpoint"
}
