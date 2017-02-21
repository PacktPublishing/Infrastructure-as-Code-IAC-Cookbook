// Monitoring the CoreOS Members
resource "statuscake_test" "coreos_cluster" {
  count        = "${var.cluster_nodes}"
  website_name = "${element(digitalocean_droplet.coreos.*.name, count.index)}.${var.cluster_domainname}"
  website_url  = "${element(digitalocean_droplet.coreos.*.ipv4_address, count.index)}"
  test_type    = "PING"
  check_rate   = 300
  paused       = false
}
