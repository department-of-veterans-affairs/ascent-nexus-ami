# A security group for the ELB so it is accessible via the web
resource "aws_security_group" "nexus_elb" {
  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  # HTTP access from anywhere
  ingress {
    from_port   = "${var.https_port}"
    to_port     = "${var.https_port}"
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_cidr_blocks}"]
  }

  # Docker repository connector ports
  ingress {
    from_port   = "${var.docker_lower_bound_port}"
    to_port     = "${var.docker_upper_bound_port}"
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_cidr_blocks}"]
  }

  # outbound internet access
  egress {
    from_port   = "${var.outbound_access_port}"
    to_port     = "${var.outbound_access_port}"
    protocol    = "-1"
    cidr_blocks = ["${var.allowed_cidr_blocks}"]
  }
}
