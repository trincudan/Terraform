resource "aws_alb" "web_alb" {
  name               = "web-alb"
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.public_subnets
}

resource "aws_alb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_alb_listener" "web_listener" {
  load_balancer_arn = aws_alb.web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.web_tg.arn
  }
}
