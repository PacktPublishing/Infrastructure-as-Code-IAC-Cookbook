provider "aws" {
  access_key = "AA"
  secret_key = "BB"
  region     = "eu-west-1"
}

resource "aws_instance" "vm" {
  ami           = "ami-643d4217"
  instance_type = "t2.micro"
  key_name      = "samplekey"
  user_data     = "${file("cloud-config.ubuntu.yml")}"
}
