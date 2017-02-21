resource "digitalocean_droplet" "coreos" {
  image              = "${var.coreos_channel}"
  count              = "${var.cluster_nodes}"
  name               = "coreos-${count.index+1}"
  region             = "${var.do_region}"
  size               = "${var.do_droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  user_data          = "${file("cloud-config.yml")}"
  backups            = false
  private_networking = true
}
