resource "packet_device" "swarm_master" {
  hostname         = "swarm-master"
  plan             = "${var.plan}"
  facility         = "${var.facility}"
  operating_system = "${var.operating_system}"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.swarm.id}"

  # update and install docker
  provisioner "remote-exec" {
    connection {
      user        = "${var.ssh_username}"
      private_key = "${file("${var.ssh_key}")}"
    }

    scripts = [
      "scripts/update_os.sh",
      "scripts/install_docker.sh",
    ]
  }

  # init docker swarm
  provisioner "remote-exec" {
    connection {
      user        = "${var.ssh_username}"
      private_key = "${file("${var.ssh_key}")}"
    }

    inline = [
      "docker swarm init --advertise-addr ${packet_device.swarm_master.network.2.address}",
      "docker swarm join-token worker -q > swarm.token",
    ]
  }

  # grab the token
  provisioner "local-exec" {
    command = "ssh -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ${var.ssh_key} ${var.ssh_username}@${packet_device.swarm_master.network.0.address} \"docker swarm join-token worker -q\" > ${var.worker_token_file}"
  }
}

resource "packet_device" "swarm_node" {
  count            = "${var.num_nodes}"
  hostname         = "swarm-node-${count.index+1}"
  plan             = "${var.plan}"
  facility         = "${var.facility}"
  operating_system = "${var.operating_system}"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.swarm.id}"

  provisioner "file" {
    source      = "${var.worker_token_file}"
    destination = "${var.worker_token_file}"
  }

  provisioner "file" {
    source      = "scripts/join_swarm.sh"
    destination = "join_swarm.sh"
  }

  provisioner "remote-exec" {
    connection {
      user        = "${var.ssh_username}"
      private_key = "${file("${var.ssh_key}")}"
    }

    scripts = [
      "scripts/update_os.sh",
      "scripts/install_docker.sh",
    ]
  }

  provisioner "remote-exec" {
    connection {
      user        = "${var.ssh_username}"
      private_key = "${file("${var.ssh_key}")}"
    }

    inline = [
      "chmod +x join_swarm.sh",
      "./join_swarm.sh ${packet_device.swarm_master.network.2.address}",
    ]
  }
}
