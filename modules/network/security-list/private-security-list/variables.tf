variable "compartment_id" {}
variable "vcn_id" {}
variable "env_name" {}
variable "private_ingress_rules" {
  description = "List of ingress security rules for the private security list"
  type = list(object({
    protocol    = string
    source      = string
    source_type = string
  }))   
  
}