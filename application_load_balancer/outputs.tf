output "dns_name" {
  description = "The DNS name of the load balancer."
  value       = "${aws_lb.application.dns_name}"
}

output "load_balancer_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = "${aws_lb.application.id}"
}

output "load_balancer_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = "${aws_lb.application.zone_id}"
}

