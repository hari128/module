output all_public_subnets {
  value       = "${module.devopsb16-testvpc.all_public_subnets}"
}
output all_private_subnets {
  value       = "${module.devopsb16-testvpc.all_private_subnets}"
}

output public_subnet_1 {
  value       = "${module.devopsb16-testvpc.subnet1id}"
}

output public_subnet_2 {
  value       = "${module.devopsb16-testvpc.subnet2id}"
}

output public_subnet_3 {
  value       = "${module.devopsb16-testvpc.subnet3id}"
}

output env {
  value       = "${module.devopsb16-testvpc.env}"
}
