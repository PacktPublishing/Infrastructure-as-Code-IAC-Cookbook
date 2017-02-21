resource "aws_instance" "coreos" {
  count                       = "${var.cluster_size}"
  ami                         = "${var.aws_coreos_ami}"
  instance_type               = "${var.aws_instance_type}"
  key_name                    = "${aws_key_pair.admin_key.key_name}"
  associate_public_ip_address = true

  tags {
    Name = "coreos_${count.index+1}"
  }
}
