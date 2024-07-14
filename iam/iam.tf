resource "aws_iam_role" "autoscaling_role" {
  name = "autoscaling_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "autoscaling.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "autoscaling_role_policy_attachment" {
  role       = aws_iam_role.autoscaling_role.name
  policy_arn = var.policy_arn_ASfullaccess
}