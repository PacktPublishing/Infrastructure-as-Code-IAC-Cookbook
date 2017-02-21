resource "aws_instance" "vm" {
  ami               = "ami-e3d6ab90"
  instance_type     = "t2.micro"
  availability_zone = "eu-west-1a"
  key_name          = "manual cloud init"
  user_data         = "${file("cloud-config.yml")}"
}
