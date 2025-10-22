output "compartment_id" {
  description = "The OCID of the compartment"
  value       = oci_identity_compartment.sub_compartment.id
  
}
output "name" {

  description = "The name of the compartment"
  value       = oci_identity_compartment.sub_compartment.name
}