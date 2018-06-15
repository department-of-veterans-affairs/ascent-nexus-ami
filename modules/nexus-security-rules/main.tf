resource "aws_security_group_rule" "allow_http_inbound_from_cidr_blocks" {
  count       = "${length(var.allowed_inbound_cidr_blocks) >= 1 ? 1 : 0}"
  type        = "ingress"
  from_port   = "${var.http_port}"
  to_port     = "${var.http_port}"
  protocol    = "tcp"
  cidr_blocks = ["${var.allowed_inbound_cidr_blocks}"]

  security_group_id = "${var.security_group_id}"
}

resource "aws_security_group_rule" "allow_http_inbound_from_security_group" {
  count                    = "${length(var.allowed_inbound_security_groups)}"
  type                     = "ingress"
  from_port                = "${var.http_port}"
  to_port                  = "${var.http_port}"
  protocol                 = "tcp"
  source_security_group_id = "${element(var.allowed_inbound_security_groups, count.index)}"

  security_group_id = "${var.security_group_id}"
}

resource "aws_security_group_rule" "allow_docker_inbound_from_cidr_blocks" {
  count       = "${length(var.allowed_inbound_cidr_blocks) >= 1 ? 1 : 0}"
  type        = "ingress"
  from_port   = "${var.docker_lower_bound_port}"
  to_port     = "${var.docker_upper_bound_port}"
  protocol    = "tcp"
  cidr_blocks = ["${var.allowed_inbound_cidr_blocks}"]

  security_group_id = "${var.security_group_id}"
}

resource "aws_security_group_rule" "allow_docker_inbound_from_security_group" {
  count                    = "${length(var.allowed_inbound_security_groups)}"
  type                     = "ingress"
  from_port                = "${var.docker_lower_bound_port}"
  to_port                  = "${var.docker_upper_bound_port}"
  protocol                 = "tcp"
  source_security_group_id = "${element(var.allowed_inbound_security_groups, count.index)}"

  security_group_id = "${var.security_group_id}"
}
