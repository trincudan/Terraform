variable "aws_region" {
  description = "The AWS region to deploy resources"
  default = "eu-central-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2"
  default = "ami-0e553a1955c1b0e75"
}

variable "iam_role" {
  description = "IAM Role for Auto Scaling"
  default = "arn:aws:iam::470587818114:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
}