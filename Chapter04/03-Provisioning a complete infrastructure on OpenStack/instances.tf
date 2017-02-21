resource "openstack_compute_instance_v2" "gitlab" {
  name            = "gitlab"
  region          = "${var.region}"
  image_name      = "${var.image_name}"
  flavor_name     = "${var.flavor_name}"
  key_pair        = "${openstack_compute_keypair_v2.ssh.name}"
  security_groups = ["${openstack_compute_secgroup_v2.base-sg.name}", "${openstack_compute_secgroup_v2.http-sg.name}"]

  volume {
    volume_id = "${openstack_blockstorage_volume_v2.docker.id}"
    device    = "/dev/vdb"
  }

  provisioner "remote-exec" {
    connection {
      user        = "${var.ssh_username}"
      private_key = "${file("${var.ssh_key_file}")}"
    }

    inline = [
      "sudo mkfs.ext4 /dev/vdb",
      "sudo mkdir /var/lib/docker",
      "sudo su -c \"echo '/dev/vdb /var/lib/docker ext4 defaults 0 0' >> /etc/fstab\"",
      "sudo mount -a",
      "sudo apt update -y",
      "sudo apt upgrade -y",
      "sudo apt install -y docker.io",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo docker run -d -p 80:80 --name gitlab gitlab/gitlab-ce:latest",
    ]
  }
}

resource "openstack_blockstorage_volume_v2" "docker" {
  region      = "${var.region}"
  name        = "docker-vol"
  description = "Docker volume"
  size        = 10
}

resource "openstack_compute_instance_v2" "runner" {
  count           = "${var.num_runners}"
  name            = "gitlab-runner-${count.index+1}"
  region          = "${var.region}"
  image_name      = "${var.image_name}"
  flavor_name     = "${var.flavor_name}"
  key_pair        = "${openstack_compute_keypair_v2.ssh.name}"
  security_groups = ["${openstack_compute_secgroup_v2.base-sg.name}", "${openstack_compute_secgroup_v2.http-sg.name}"]

  provisioner "remote-exec" {
    connection {
      user        = "${var.ssh_username}"
      private_key = "${file("${var.ssh_key_file}")}"
    }

    inline = [
      "sudo apt update -y",
      "sudo apt upgrade -y",
      "sudo apt install -y docker.io",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo docker run -d --name gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest",
    ]
  }
}
