output "elb_ip" {
  value = "${module.nexus_elb.elb_dns}"
}
