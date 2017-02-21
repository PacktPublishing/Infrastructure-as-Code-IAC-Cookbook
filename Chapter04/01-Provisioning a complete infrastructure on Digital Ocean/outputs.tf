output "CoreOS Cluster Members" {
  value = "${formatlist("ssh core@%v -i ${var.ssh_key_file}", digitalocean_droplet.coreos.*.ipv4_address)}"
}

output "CoreOS Cluster Members DNS" {
  value = "${formatlist("ssh core@%v -i ${var.ssh_key_file}", digitalocean_record.ipv4.*.fqdn)}"
}

output "StatusCake Account" {
  value = "${var.statuscake_username}"
}
