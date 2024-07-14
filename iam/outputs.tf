output "autoscaling_role_arn" {
  description = "The ARN of the service-linked role for Auto Scaling"
  value = aws_iam_role.autoscaling_role.arn
}
