resource "aws_iam_user" "mary" {
  name = "mary"
  path = "/team/"
}

resource "aws_iam_access_key" "mary" {
  user = "${aws_iam_user.mary.name}"
}

resource "aws_iam_user_policy_attachment" "mary_s3full" {
    user = "${aws_iam_user.mary.name}"
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_user" "joe" {
  name = "joe"
  path = "/team/"
}

resource "aws_iam_access_key" "joe" {
  user = "${aws_iam_user.joe.name}"
}

resource "aws_iam_user_policy_attachment" "joe_ec2ro" {
    user = "${aws_iam_user.joe.name}"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_user" "logs" {
  name = "logs"
  path = "/apps/"
}

resource "aws_iam_access_key" "logs" {
  user = "${aws_iam_user.logs.name}"
}

resource "aws_iam_user_policy_attachment" "logs_cloudwatch_full" {
    user = "${aws_iam_user.logs.name}"
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
