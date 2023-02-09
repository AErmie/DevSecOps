resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 5
  require_lowercase_characters   = false
#  require_numbers                = true
#  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 91
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Effect": "Allow",
      "Resource": "ec2"
    }
  ]
}
EOF
}