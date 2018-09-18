resource "aws_elb" "service" {
  count = "${var.service_type == "web" ? 1 : 0}"
  name = "${var.environment}-${var.name}"
  subnets = ["${var.elb_subnets}"]
  security_groups = ["${aws_security_group.service-lb.id}", "${var.elb_additional_security_groups}"]

  listener {
    instance_port = "${var.host_port}"
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  listener {
    instance_port = "${var.host_port}"
    instance_protocol = "http"
    lb_port = 443
    lb_protocol = "https"
    ssl_certificate_id = "${var.certificate_arn}"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "TCP:${var.host_port}"
    interval = 30
  }

  internal = "${var.elb_internal}"
  cross_zone_load_balancing = true
  idle_timeout = 600
  connection_draining = true
  connection_draining_timeout = 600


  tags {
    Name = "${var.environment}-${var.name}"
  }
}