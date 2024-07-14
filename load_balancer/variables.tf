variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type = list(string)
}
