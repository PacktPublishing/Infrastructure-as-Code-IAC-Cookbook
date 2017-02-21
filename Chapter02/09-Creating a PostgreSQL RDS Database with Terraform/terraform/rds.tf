resource "aws_db_instance" "db" {
  engine            = "${var.rds_engine}"
  engine_version    = "${var.rds_engine_version}"
  identifier        = "${var.rds_identifier}"
  instance_class    = "${var.rds_instance_type}"
  allocated_storage = "${var.rds_storage_size}"
  name              = "${var.rds_db_name}"
  username          = "${var.rds_admin_user}"
  password          = "${var.rds_admin_password}"

  #multi_az                   = "${var.rds_multi_az}"
  publicly_accessible    = "${var.rds_publicly_accessible}"
  vpc_security_group_ids = ["${aws_security_group.rds_security_group.id}"]

  #auto_minor_version_upgrade = "${var.rds_auto_minor_version_upgrade}"
  #db_subnet_group_name       = "${var.rds_db_subnet_group_name}"
  #apply_immediately          = "${var.rds_apply_immediately}"
  tags {
    Name = "IAC Database in ${var.aws_region}"
  }
}
