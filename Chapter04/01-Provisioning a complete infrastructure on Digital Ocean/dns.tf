resource "digitalocean_domain" "cluster_domainname" {
  name       = "${var.cluster_domainname}"
  ip_address = "${digitalocean_droplet.coreos.0.ipv4_address}"
}

resource "digitalocean_record" "ipv4" {
  count  = "${var.cluster_nodes}"
  domain = "${digitalocean_domain.cluster_domainname.name}"
  type   = "A"
  name   = "${element(digitalocean_droplet.coreos.*.name, count.index)}"
  value  = "${element(digitalocean_droplet.coreos.*.ipv4_address, count.index)}"
}
