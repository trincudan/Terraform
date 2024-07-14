resource "aws_launch_configuration" "web_lc" {
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = var.security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello, World" > /var/www/html/index.html
              EOF
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_lc.id
  vpc_zone_identifier  = var.public_subnets
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1

  target_group_arns = [var.target_group_arn]

  service_linked_role_arn = var.service_linked_role_arn

  tag {
    key                 = "Name"
    value               = "web-asg"
    propagate_at_launch = true
  }
}
