provider "aws" {
  version = "~> 2.0"
  region = "sa-east-1"
}

resource "aws_iam_user" "rtk" {
  name = "RTK"
}

resource "aws_iam_policy" "custom_policy" {
  name = "GlacierEFSEC2"

  policy = <<EOF

  EOF
}

resource "aws_iam_policy_attachment" "policy_bind" {
  name = "attachment"
  users = [aws_iam_user.rtk.name]
  policy_arn = aws_iam_policy.custom_policy.arn
}