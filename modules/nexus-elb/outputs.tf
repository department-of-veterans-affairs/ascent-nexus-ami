output "security_group_id" {
  value = "${module.elb_security_group.security_group_id}"
}

output "elb_dns" {
  value = "${aws_elb.nexus.zone_id}"
}
