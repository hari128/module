output vpcid {
  value       = "${aws_vpc.default.id}"
}

output subnet1id {
  value       = "${ aws_subnet.subnet1-public.id}"
}


output subnet2id {
  value       = "${aws_subnet.subnet2-public.id}"
}


output subnet3id {
  value       = "${aws_subnet.subnet3-public.id}"
}

output sgid {
  value       = "${aws_security_group.allow_all.id}"
}

