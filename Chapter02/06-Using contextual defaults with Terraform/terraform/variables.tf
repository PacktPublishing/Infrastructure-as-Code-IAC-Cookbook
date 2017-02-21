variable "aws_ssh_admin_key_file" {}

variable "ami" {
  default = {
    eu-west-1 = "ami-ee6b189d"
    us-east-1 = "ami-4f680658"
    us-west-1 = "ami-68a9e408"
  }
}

variable "aws_instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "us-east-1"
}
