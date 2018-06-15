output "private_ip" {
  value = "${aws_instance.nexus.private_ip}"
}

output "security_group_id" {
  value = "${aws_security_group.nexus.id}"
}
