resource "aws_instance" "centos" {
  ami                         = "${lookup(var.aws_centos_ami, var.aws_region)}"
  instance_type               = "${var.aws_instance_type}"
  key_name                    = "${aws_key_pair.admin_key.key_name}"
  security_groups             = ["${aws_security_group.base_security_group.name}"]
  associate_public_ip_address = true

  connection {
    type     = "ssh"
    user     = "${var.ssh_user}"
    key_file = "${var.aws_ssh_admin_key_file}"
  }

  provisioner "chef" {
    node_name              = "centos-${count.index+1}"
    run_list               = ["starter"]
    server_url             = "${var.chef_server_url}"
    validation_client_name = "${var.chef_validation_client_name}"
    validation_key         = "${file("chef/validator.pem")}"
    version                = "${var.chef_version}"
  }

  tags {
    Name = "CentOS-${count.index+1} by Terraform"
  }
}
