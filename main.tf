module "vpc" {
  source = "./vpc"
  cidr_block = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source = "./load_balancer"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  security_group_ids = [module.security_groups.web_sg_id]
}

module "auto_scaling" {
  source = "./auto_scaling"
  public_subnets = module.vpc.public_subnets
  security_group_ids = [module.security_groups.web_sg_id]
  target_group_arn = module.load_balancer.target_group_arn
  instance_type = var.instance_type
  ami_id = var.ami_id
  service_linked_role_arn = var.iam_role
}

module "iam" {
  source = "./iam"
}

output "alb_dns_name" {
  value = module.load_balancer.alb_dns_name
}
