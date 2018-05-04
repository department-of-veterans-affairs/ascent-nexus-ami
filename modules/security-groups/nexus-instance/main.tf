
resource "aws_security_group" "vets_nexus" {
  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  # HTTP access from anywhere
  ingress {
    from_port   = "${var.http_port}"
    to_port     = "${var.http_port}"
    protocol    = "tcp"
    security_groups = ["${var.elb_security_group_ids}"]
  }

  # Docker repository connector ports
  ingress {
    from_port   = "${var.docker_lower_bound_port}"
    to_port     = "${var.docker_upper_bound_port}"
    protocol    = "tcp"
    security_groups = ["${var.elb_security_group_ids}"]
  }

  # SSH access from anywhere
  ingress {
    from_port   = "${var.ssh_port}"
    to_port     = "${var.ssh_port}"
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_cidr_blocks}"]
  }

  # Monitoring Client
  ingress {
    from_port   = "${var.monitoring_client_port}"
    to_port     = "${var.monitoring_client_port}"
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
