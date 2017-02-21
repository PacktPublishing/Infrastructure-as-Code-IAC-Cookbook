resource "aws_instance" "coreos" {
  count                       = "${lookup(var.cluster_size, var.environment)}"
  ami                         = "${lookup(var.aws_coreos_ami, var.aws_region)}"
  instance_type               = "${lookup(var.aws_instance_type, var.environment)}"
  key_name                    = "${aws_key_pair.admin_key.key_name}"
  associate_public_ip_address = true

  tags {
    Name        = "coreos_${var.environment}_${count.index+1}"
    Environment = "${var.environment}"
  }
}
