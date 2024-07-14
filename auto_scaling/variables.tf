variable "public_subnets" {
  description = "List of public subnet IDs"
  type = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type = list(string)
}

variable "target_group_arn" {
  description = "The ARN of the target group"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
}

variable "service_linked_role_arn" {
  description = "The ARN of the service-linked role for Auto Scaling"
}
