# Create a new SSH key
resource "digitalocean_ssh_key" "default" {
  name       = "Digital Ocean SSH Key"
  public_key = "${file("${var.ssh_key_file}.pub")}"
}
