resource "aws_route53_record" "service" {
  count = "${var.service_type == "web" ? 1 : 0}"
  zone_id = "${var.route53_primary_zone_id}"
  name = "${var.environment}-${var.name}"
  type = "A"

  alias {
    name = "${aws_elb.service.dns_name}"
    zone_id = "${aws_elb.service.zone_id}"
    evaluate_target_health = false
  }
}
