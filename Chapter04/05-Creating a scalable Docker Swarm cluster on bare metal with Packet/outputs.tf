output "SSH Key" {
  value = "${packet_ssh_key.admin.name}"
}

output "Swarm Master Public IP" {
  value = "${join(",", packet_device.swarm_master.*.network.0.address)}"
}

output "Swarm Master Private IP" {
  value = "${join(",", packet_device.swarm_master.*.network.2.address)}"
}

output "Swarm Nodes" {
  value = "Public: ${join(",", packet_device.swarm_node.*.network.0.address)}, Private: ${join(",", packet_device.swarm_node.*.network.2.address)}"
}

output "Bootstrap Docker Swarm" {
  value = "ssh root@${packet_device.swarm_master.network.0.address} \"docker swarm init --advertise-addr ${packet_device.swarm_master.network.2.address}\""
}
