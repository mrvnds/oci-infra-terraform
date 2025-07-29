resource "oci_core_instance" "public_bastion" {
  display_name          = "${var.env_name}-public-bastion"
  availability_domain   = data.oci_identity_availability_domains.ads.availability_domains[var.public_bastion_ad].name
  compartment_id        = var.compartment_id
  shape                 = var.public_bastion_shape

  shape_config {
    ocpus         = var.public_bastion_ocpus
    memory_in_gbs = var.public_bastion_memory_in_gbs
  }

  create_vnic_details {
    subnet_id              = var.public_subnet_id
    assign_public_ip       = true
    display_name           = "${var.env_name}-public-bastion"
  }


  source_details {
  source_type = "image"
  source_id   = data.oci_core_images.oracle_linux.images[0].id
  boot_volume_size_in_gbs  = var.public_bastion_boot_volume_size_in_gbs
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
  filename             = "../../environment/${var.env_name}/ssh-keys/public-bastion-key.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}

resource "local_file" "bastion_public_key" {
  content              = tls_private_key.bastion_key.public_key_openssh
  filename             = "../../environment/${var.env_name}/ssh-keys/public-bastion-key.pub"
  file_permission      = "0644"
  directory_permission = "0700"
}