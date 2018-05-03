

output "elb_ip" {
  value = "${aws_elb.nexus.dns_name}"
}