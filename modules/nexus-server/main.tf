data "aws_ami" "nexus" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ascent-nexus *"]
  }

  owners = ["272417811699"]
}

resource "aws_instance" "vets_nexus" {
  instance_type = "${var.instance_type}"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${var.ami_id}"

  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${module.nexus_instance_security_group.security_group_id}"]

  # We're going to launch into the same subnet as our ELB. In a production
  # environment it's more common to have a separate private subnet for
  # backend instances.
  subnet_id = "${var.instance_subnet_id}"

  tags {
    Name = "${var.instance_name}"
    ProjectName = "${var.project_name}"
    VAECID = "${var.vaecid}"
    Environment = "${var.env}"
  }
}

module "nexus_instance_security_group" {
  source   = "../security-groups/nexus-instance/"
  vpc_id   = "${var.vpc_id}"
  elb_security_group_ids = ["${module.nexus_elb.security_group_id}"]
}

module "nexus_elb" {
  source = "../nexus-elb/"
  vpc_id = "${var.vpc_id}"
  elb_subnet_ids = "${var.elb_subnet_ids}"
  nexus_instance_ids = ["${aws_instance.vets_nexus.id}"]
  elb_cert_arn = "${var.elb_cert_arn}"
}
