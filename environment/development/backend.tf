# terraform {
#   backend "oci" {
#     bucket     = "dbe09-devops-terraform-state"
#     namespace  = "idclunvjezp6"
#     region     = "us-ashburn-1"
#     key        = "main/infra.tfstate"
#   }
# }

terraform {
  backend "oci" {}
}