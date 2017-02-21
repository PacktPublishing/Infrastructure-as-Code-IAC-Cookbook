@test "Apache version is correct" {
  run docker run --rm demo-httpd:latest -v \| grep 2.4.10
  [ $status -eq 0 ]
}
