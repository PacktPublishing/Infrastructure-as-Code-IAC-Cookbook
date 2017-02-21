resource "openstack_compute_secgroup_v2" "base-sg" {
  name        = "base-sg"
  description = "Base Security Group"
  region      = "${var.region}"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "${var.allowed_network}"
  }
}

resource "openstack_compute_secgroup_v2" "http-sg" {
  name        = "http-sg"
  description = "HTTP Security Group"
  region      = "${var.region}"

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
