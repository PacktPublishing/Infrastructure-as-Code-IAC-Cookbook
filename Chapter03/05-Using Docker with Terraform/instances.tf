

/*resource "aws_instance" "coreos" {
  ami                         = "${lookup(var.aws_coreos_ami, var.aws_region)}"
  instance_type               = "${var.aws_instance_type}"
  key_name                    = "${aws_key_pair.admin_key.key_name}"
  security_groups             = ["${aws_security_group.base_security_group.name}"]
  user_data                   = "${file("cloud-config.yml")}"
  associate_public_ip_address = true
  provider                    = "aws.${var.aws_region}"

  tags {
    Name = "coreos"
  }
}*/

