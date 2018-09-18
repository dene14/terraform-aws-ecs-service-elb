resource "aws_security_group" "service-lb" {
  name = "${var.environment}-${var.name}-lb"
  description = "Base group for LB of ${var.environment}-${var.name}"
  vpc_id = "${var.vpc_id}"

# Any ingress permissions should be added separately
#  ingress {
#    from_port = 443
#    to_port = 443
#    protocol = "tcp"
#    security_groups = []
#    cidr_blocks = [
#       "0.0.0.0/0"
#    ]
#  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.environment}-${var.name}-lb"
  }
}
