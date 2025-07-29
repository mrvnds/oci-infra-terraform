resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-igw"
}

resource "oci_core_nat_gateway" "nat" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-nat-gw"
}

resource "oci_core_service_gateway" "sgw" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-sgw"

  services {
    service_id = data.oci_core_services.all_oci_services.services[0].id
  }
}

resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-public-rt"

  route_rules {
    network_entity_id = oci_core_internet_gateway.igw.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_route_table" "private_rt" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-private-rt"

  route_rules {
    network_entity_id = oci_core_nat_gateway.nat.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }

  route_rules {
    network_entity_id = oci_core_service_gateway.sgw.id
    destination_type  = "SERVICE_CIDR_BLOCK"
    destination       = data.oci_core_services.all_oci_services.services[0].cidr_block
  }
}

resource "oci_core_subnet" "public" {
  cidr_block                = var.public_subnet_cidr
  display_name              = "${var.env_name}-public-subnet"
  compartment_id            = var.compartment_id
  vcn_id                    = var.vcn_id
  route_table_id            = oci_core_route_table.public_rt.id
  security_list_ids         = [oci_core_security_list.public.id]
  dns_label                 = "${var.env_name}pub"
  prohibit_public_ip_on_vnic = false
}
resource "oci_core_subnet" "lb" {
  cidr_block                = var.lb_subnet_cidr
  display_name              = "${var.env_name}-lb-subnet"
  compartment_id            = var.compartment_id
  vcn_id                    = var.vcn_id
  route_table_id            = oci_core_route_table.public_rt.id
  security_list_ids         = [oci_core_security_list.public.id]
  dns_label                 = "${var.env_name}lb"
  prohibit_public_ip_on_vnic = false
}


resource "oci_core_subnet" "private" {
  cidr_block                = var.private_subnet_cidr
  display_name              = "${var.env_name}-private-subnet"
  compartment_id            = var.compartment_id
  vcn_id                    = var.vcn_id
  route_table_id            = oci_core_route_table.private_rt.id
  security_list_ids         = [oci_core_security_list.private.id]
  dns_label                 = "${var.env_name}priv"
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_security_list" "public" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-public-sl"

  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    icmp_options {
      type = 3
      code = 4
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "lb" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-lb-sl"

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
    description = "Allow inbound HTTP traffic"
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
    description = "Allow inbound HTTPS traffic"
  }
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "private" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-private-sl"

  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

data "oci_core_services" "all_oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}