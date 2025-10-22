output "public_security_list_id" {
  description = "The ID of the public security list"
  value       = oci_core_security_list.public.id
  
}