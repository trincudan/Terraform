variable "cidr_block" {
  description = "The CIDR block for the VPC"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}
