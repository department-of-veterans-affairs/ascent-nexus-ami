output "private_ip" {
  value = "${aws_instance.nexus.private_ip}"
}

output "instance_id" {
  value = "${aws_instance.nexus.id}"
}

output "security_group_id" {
  value = "${aws_security_group.nexus.id}"
}

output "http_port" {
  value = "${module.nexus_instance_security_group.http_port}"
}

output "docker_lower_bound_port" {
  value = "${module.nexus_instance_security_group.docker_lower_bound_port}"
}

output "docker_upper_bound_port" {
  value = "${module.nexus_instance_security_group.docker_upper_bound_port}"
}