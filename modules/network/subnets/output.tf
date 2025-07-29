output "public_subnet_id" {
  value = oci_core_subnet.public.id
}

output "private_subnet_id" {
  value = oci_core_subnet.private.id
}

output "lb_subnet_id" {
  value = oci_core_subnet.lb.id
}
output "subnet_domain_name" {
  value = oci_core_subnet.private.subnet_domain_name
}