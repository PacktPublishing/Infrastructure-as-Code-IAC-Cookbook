name "mysite"
description "MySite role"
run_list(
  "role[webserver]",
  "role[database]",
  "recipe[mysite]"
)
