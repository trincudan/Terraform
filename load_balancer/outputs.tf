output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value = aws_alb.web_alb.dns_name
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value = aws_alb_target_group.web_tg.arn
}
