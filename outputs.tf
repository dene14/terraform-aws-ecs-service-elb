output "logging.group_name" {
  value = "${aws_cloudwatch_log_group.service.name}"
}

output "elb.security_group" {
  value = "${aws_security_group.service-lb.id}"
}

output "elb.dns_name" {
  value = "${aws_elb.service.dns_name}"
}

output "elb.zone_id" {
  value = "${aws_elb.service.zone_id}"
}

output "service.name" {
  value = "${var.name}"
}

output "service.environment" {
  value = "${var.environment}"
}

output "service.fqdn" {
  value = "${aws_route53_record.service.fqdn}"
}
