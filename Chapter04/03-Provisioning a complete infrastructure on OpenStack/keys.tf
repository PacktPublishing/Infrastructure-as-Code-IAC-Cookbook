resource "openstack_compute_keypair_v2" "ssh" {
  name       = "Admin SSH Public Key"
  region     = "${var.region}"
  public_key = "${file("${var.ssh_key_file}.pub")}"
}
