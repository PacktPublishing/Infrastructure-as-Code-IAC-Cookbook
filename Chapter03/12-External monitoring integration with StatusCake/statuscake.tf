resource "statuscake_test" "latency" {
  website_name = "My Server Latency"
  website_url  = "1.2.3.4"

  // website_url = "${aws_instance.centos.public_ip}"
  test_type  = "PING"
  check_rate = 300
  paused     = false
}

resource "statuscake_test" "another_latency" {
  website_name = "${element(aws_instance.centos.*.public_ip, count.index)}"
  website_url  = "${element(aws_instance.centos.*.public_ip, count.index)}"
  test_type    = "PING"
  check_rate   = 300
  paused       = false
}

resource "statuscake_test" "http" {
  website_name = "my.myweb.com Availability"
  website_url  = "https://www.myweb.com:443"
  test_type    = "HTTP"
  check_rate   = 300
}
