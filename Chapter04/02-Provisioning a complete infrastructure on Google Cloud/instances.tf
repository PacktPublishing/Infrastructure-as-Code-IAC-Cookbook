resource "google_compute_instance" "www" {
  count        = "${var.www_servers}"
  name         = "www-${count.index+1}"
  machine_type = "${var.machine_type}"
  zone         = "${var.region}-${var.zone}"
  tags         = ["www"]

  disk {
    image = "${var.disk_image}"
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = ""
    }
  }

  metadata {
    ssh-keys = "${var.ssh_username}:${file("${var.ssh_key}.pub")}"
  }

  provisioner "remote-exec" {
    connection {
      user        = "${var.ssh_username}"
      private_key = "${file("${var.ssh_key}")}"
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
    ]
  }
}
