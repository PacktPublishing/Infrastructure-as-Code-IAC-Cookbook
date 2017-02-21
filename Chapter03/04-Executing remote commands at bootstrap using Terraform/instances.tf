resource "aws_instance" "centos" {
  ami                         = "${lookup(var.aws_centos_ami, var.aws_region)}"
  instance_type               = "${var.aws_instance_type}"
  key_name                    = "${aws_key_pair.admin_key.key_name}"
  security_groups             = ["${aws_security_group.base_security_group.name}"]
  associate_public_ip_address = true

  tags {
    Name = "CentOS"
  }

  provisioner "remote-exec" {
    inline = [
      "echo \"nameserver 8.8.8.8\" | sudo tee -a /etc/resolv.conf",
      "sudo yum update -y",
      "sudo yum install epel-release -y",
      "sudo yum install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm -y",
      "sudo yum install puppet-agent -y",
      "sudo /opt/puppetlabs/bin/puppet agent --version"
    ]
    connection {
        user = "centos"
      }
  }
}
