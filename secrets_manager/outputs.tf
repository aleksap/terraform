output "secret_arn" {
  value = "${aws_secretsmanager_secret.secret_key.arn}"
}