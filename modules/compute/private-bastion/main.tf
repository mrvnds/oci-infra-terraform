resource "oci_core_instance" "private_bastion" {
  for_each = var.private_bastion_names
  
  display_name          = "${var.env_name}-${each.value}"
  availability_domain   = data.oci_identity_availability_domains.ads.availability_domains[var.private_bastion_ad].name
  compartment_id        = var.compartment_id
  shape                 = var.private_bastion_shape

  shape_config {
    ocpus         = var.private_bastion_ocpus
    memory_in_gbs = var.private_bastion_memory_in_gbs
  }

  create_vnic_details {
    subnet_id              = var.private_subnet_id
    assign_public_ip       = false
    display_name           = "${var.env_name}-${each.value}"
  }


  source_details {
  source_type = "image"
  source_id   = data.oci_core_images.oracle_linux.images[0].id
  boot_volume_size_in_gbs  = var.private_bastion_boot_volume_size_in_gbs
  }

   metadata = {
    ssh_authorized_keys = tls_private_key.bastion_key.public_key_openssh
  }
  preserve_boot_volume = false
}


resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "local_file" "bastion_private_key" {
  content              = tls_private_key.bastion_key.private_key_pem
  filename             = "../../private-bastion-key.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}

resource "local_file" "bastion_public_key" {
  content              = tls_private_key.bastion_key.public_key_openssh
  filename             = "../../private-bastion-key.pub"
  file_permission      = "0644"
  directory_permission = "0700"
}

# resource "null_resource" "upload_public_key" {
#   triggers = {
#     env_name      = var.env_name
#     bucket_name   = "${var.env_name}-ssh-keys-bucket"
#     namespace     = data.oci_objectstorage_namespace.ns.namespace
#   }

#   provisioner "local-exec" {
#     command = "oci os object put --bucket-name ${self.triggers.bucket_name} --file private-bastion-key.pem --name ${self.triggers.env_name}-private-bastion-key.pem --namespace ${self.triggers.namespace}"
#   }

#   provisioner "local-exec" {
#     when    = destroy
#     command = "oci os object delete --bucket-name ${self.triggers.bucket_name} --name ${self.triggers.env_name}-private-bastion-key.pem --namespace ${self.triggers.namespace} --force"
#   }
# }