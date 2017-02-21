data "template_file" "ansible_hosts" {
  template = "${file("hosts.tpl")}"

  vars {
    host_public_ipv4 = "${aws_instance.centos.public_ip}"
  }
}

resource "null_resource" "generate_ansible_hosts" {
  provisioner "local-exec" {
    command = "echo '${data.template_file.ansible_hosts.rendered}' > hosts"
  }
}
