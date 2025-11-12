provider "aws" {
    region = var.region
  
}

module "vpc" {
    source = "git::https://github.com/Ramprasadvaral13/test-module.git//vpc?ref=main"
    vpc_cidr = var.vpc_cidr
    subnet = var.subnet
    route_cidr = var.route_cidr
  
}

module "compute" {
    source = "git::https://github.com/Ramprasadvaral13/test-module.git//compute?ref=main"
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnet_ids
    name_prefix = "dev"
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    volume_size = var.volume_size
    instance_type = var.instance_type
    key_name = var.key_name
    instance_profile_name = var.instance_profile_name

  
}