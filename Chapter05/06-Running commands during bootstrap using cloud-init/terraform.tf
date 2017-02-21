resource "aws_instance" "vm" {
  ami               = "ami-643d4217"
  instance_type     = "t2.micro"
  availability_zone = "eu-west-1a"
  key_name          = "manual cloud init"
  user_data         = "${file("cloud-config.yml")}"
}

resource "aws_ebs_volume" "ebs" {
  availability_zone = "eu-west-1a"
  size              = 5

  tags {
    Name = "Elastic Block Storage"
  }
}

resource "aws_volume_attachment" "ebs" {
  device_name = "/dev/xvdb"
  volume_id   = "${aws_ebs_volume.ebs.id}"
  instance_id = "${aws_instance.vm.id}"
}
