output "instance_information" {
  value = "${formatlist("instance: %v public: %v private: %v", aws_instance.dev.*.id, aws_instance.dev.*.public_ip, aws_instance.dev.*.private_ip)}"
}

output "security_groups" {
  value = "${formatlist("%v", aws_instance.dev.security_groups)}"
}

output "login" {
  value = "ssh ubuntu@${aws_instance.dev.public_ip} -i ${var.aws_ssh_admin_key_file}"
}
