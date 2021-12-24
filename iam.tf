
resource "aws_iam_role" "role_for_EC2" {
  name               = "${var.name}-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

resource "aws_iam_policy" "policy_for_EC2" {
  name = "${var.name}-ecr-access-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "attach_for_EC2" {
  name       = "${var.name}-attach"
  roles      = [aws_iam_role.role_for_EC2.name]
  policy_arn = aws_iam_policy.policy_for_EC2.arn
}

resource "aws_iam_instance_profile" "profile_for_EC2" {
  name = "${var.name}--instance-profile"
  role = aws_iam_role.role_for_EC2.name
}