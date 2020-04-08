#======================================================================================================================
# VPC and resources to be deployed in the VPC
#======================================================================================================================
module "vpc" {
  source      = "./modules/vpc"
  account_id  = var.account_id
  environment = var.environment
}

module "subnets" {
  source            = "./modules/subnets"
  account_id        = var.account_id
  vpc_id            = module.vpc.vpc_id_out
  environment       = var.environment
  availabilty_zones = data.aws_availability_zones.current.names
}

module "security_groups" {
  source      = "./modules/security_groups"
  account_id  = var.account_id
  vpc_id      = module.vpc.vpc_id_out
  environment = var.environment
}

#======================================================================================================================
# Resources deployed outside the VPC
#======================================================================================================================
module "dynamo_db" {
  source      = "./modules/dynamo_db"
  account_id  = var.account_id
  environment = var.environment
}

module "s3" {
  source      = "./modules/s3"
  account_id  = var.account_id
  environment = var.environment
  region      = data.aws_region.current.name
}