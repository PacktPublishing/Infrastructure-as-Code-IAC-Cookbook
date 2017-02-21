resource "packet_ssh_key" "admin" {
  name       = "admin_key"
  public_key = "${file("${var.ssh_key}.pub")}"
}
