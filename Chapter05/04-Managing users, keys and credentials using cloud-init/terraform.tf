resource "aws_instance" "vm" {
  ami           = "ami-643d4217"
  instance_type = "t2.micro"
  key_name      = "manual cloud init"
  user_data     = "${file("cloud-config.yml")}"
}
