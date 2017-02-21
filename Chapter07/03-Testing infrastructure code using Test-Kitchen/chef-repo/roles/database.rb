name "database"
description "A database server for our application"
run_list(
  "recipe[selinux::disabled]",
  "recipe[yum-mysql-community::mysql57]"
)
