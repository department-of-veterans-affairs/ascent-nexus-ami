resource "aws_instance" "nexus" {
  instance_type = "${var.instance_type}"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${var.ami_id}"

  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.nexus.id}"]

  # We're going to launch into the same subnet as our ELB. In a production
  # environment it's more common to have a separate private subnet for
  # backend instances.
  subnet_id = "${var.instance_subnet_id}"

  tags = "${merge(var.tags, map("Name", "${var.name}"))}"
}

resource "aws_security_group" "nexus" {
  name_prefix = "${var.name}"
  description = "Security group for Nexus server"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "allow_ssh_inbound_from_cidr_blocks" {
  count       = "${length(var.allowed_ssh_cidr_blocks) >= 1 ? 1 : 0}"
  type        = "ingress"
  from_port   = "${var.ssh_port}"
  to_port     = "${var.ssh_port}"
  protocol    = "tcp"
  cidr_blocks = ["${var.allowed_ssh_cidr_blocks}"]

  security_group_id = "${aws_security_group.nexus.id}"
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.nexus.id}"
}

module "nexus_instance_security_group" {
  source            = "../nexus_security_rules"
  vpc_id            = "${var.vpc_id}"
  security_group_id = "${aws_security_group.nexus.id}"
}
