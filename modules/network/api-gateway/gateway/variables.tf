variable "compartment_id" {}
variable "public_subnet_id" {}
variable "endpoint_type" {
    description = "The type of endpoint for the API Gateway. Valid values are PUBLIC and PRIVATE."
    type        = string
    default     = "PUBLIC"
    }
