resource "aws_lb" "application" {
  load_balancer_type         = "application"
  name                       = "${var.load_balancer_name}"
  internal                   = "${var.load_balancer_is_internal}"
  security_groups            = ["${var.security_groups}"]
  subnets                    = ["${var.subnets}"]
  idle_timeout               = "${var.idle_timeout}"
  enable_deletion_protection = "${var.enable_deletion_protection}"
  enable_http2               = "${var.enable_http2}"
  ip_address_type            = "${var.ip_address_type}"
  tags                       = "${var.tags}"
}


resource "aws_lb_target_group" "main" {
  name                 = "${var.target_group_name}" 
  vpc_id               = "${var.vpc_id}"
  port                 = "${var.backend_port}"
  protocol             = "${var.backend_protocol}"
  tags                 = "${var.tags}"


  health_check {
    interval            = "${var.health_check_interval}"
    path                = "${var.health_check_path}"
    port                = "${var.health_check_port}"
    healthy_threshold   = "${var.health_check_healthy_threshold}"
    unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
    timeout             = "${var.health_check_timeout}"
  }

  stickiness {
    type            = "lb_cookie"
    cookie_duration = "${var.cookie_duration}"
    enabled         = "${var.stickiness_enabled}"
  }
}


  
resource "aws_lb_listener" "frontend_http_tcp" {
  load_balancer_arn = "${aws_lb.application.arn}"
  port              = "${var.lb_http_listener_port}"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.main.arn}"
    type             = "forward"
  }
}

resource "aws_lb_listener" "frontend_https" {
  load_balancer_arn = "${aws_lb.application.arn}"
  port              = "${var.lb_https_listener_port}"
  protocol          = "HTTPS"
  certificate_arn   = "${var.listener_ssl_cert}" 
  ssl_policy        = "${var.listener_ssl_policy}" 

  default_action {
    target_group_arn = "${aws_lb_target_group.main.arn}"
    type             = "forward"
  }
}

resource "aws_alb_target_group_attachment" "svc_physical_external" {
  target_group_arn = "${aws_lb_target_group.main.arn}"
  count 		= "${var.num_ec2_instances}"
  target_id        = "${var.ec2_instance_id[count.index]}"
  port             = "${var.ec2_instance_port}" 
}


