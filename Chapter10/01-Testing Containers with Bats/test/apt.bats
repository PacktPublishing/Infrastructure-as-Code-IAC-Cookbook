@test "apt lists are empty" {
  run docker run --rm --entrypoint="/bin/sh" demo-httpd:latest -c "ls -1 /var/lib/apt/lists | wc -l"
  [ $status -eq 0 ]
  [ "$output" = "0" ]
}
