output vpcid {
  value       = "${aws_vpc.default.id}"
}

output vpcname {
  value       = "${aws_vpc.default.tags.Name}"
}

output all_public_subnets {
  value       = "${aws_subnet.public-subnets.*.id}"
}

output all_private_subnets {
  value       = "${aws_subnet.private-subnets.*.id}"
}

output subnet1id {
  value       = "${aws_subnet.public-subnets.0.id}"
}

output subnet2id {
  value       = "${aws_subnet.public-subnets.1.id}"
}

output subnet3id {
  value       = "${aws_subnet.public-subnets.2.id}"
}

output sgid {
  value       = "${aws_security_group.allow_all.id}"
}

output env {
  value       = "${var.environment}"
}
