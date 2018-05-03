resource "aws_elb" "nexus" {
  name = "vets-nexus-elb"

  subnets         = ["${var.elb_subnet_ids}"]
  security_groups = ["${module.elb_security_group.security_group_id}"]
  connection_draining = true
  instances       = ["${var.nexus_instance_ids}"]
  internal = true

  // http & https
  listener {
    // 8081
    instance_port     = "${var.http_instance_port}"
    instance_protocol = "http"
    // 443
    lb_port           = "${var.https_lb_port}"
    lb_protocol       = "https"
    //This will actually error out with a 403 if you try and create it from scratch since this is an ACM certificate, not an IAM certificate.
    //You will need to create an ELB with the lb_protocol = "http" and then configure the ACM certificate manual. Then update the terraform config to be in sync
    ssl_certificate_id = "${var.elb_cert_arn}"
  }

  // docker
  listener {
    // 5000
    instance_port     = "${var.docker_port_1}"
    instance_protocol = "http"
    // 5000
    lb_port           = "${var.docker_port_1}"
    lb_protocol       = "https"
    ssl_certificate_id = "${var.elb_cert_arn}"
  }

  // docker 2
  listener {
    // 5001
    instance_port     = "${var.docker_port_2}"
    instance_protocol = "http"
    // 5001
    lb_port           = "${var.docker_port_2}"
    lb_protocol       = "https"
    ssl_certificate_id = "${var.elb_cert_arn}"
  }

  // docker 3
  listener {
    // 5002
    instance_port     = "${var.docker_port_3}"
    instance_protocol = "http"
    // 5002
    lb_port           = "${var.docker_port_3}"
    lb_protocol       = "https"
    ssl_certificate_id = "${var.elb_cert_arn}"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    target              = "HTTP:${var.http_instance_port}/"
    interval            = "${var.interval}"
  }

  tags {
    // nexus.internal.vets-api.gov
    SAN = "${var.nexus_domain_name}"
  }
}

module "elb_security_group" {
  source = "../security-groups/elb/"
  vpc_id = "${var.vpc_id}"
}
