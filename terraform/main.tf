module "vpc" {
  source      = "./modules/vpc"
  account_id  = var.account_id
  environment = var.environment
}

module "subnets" {
  source      = "./modules/subnets"
  account_id  = var.account_id
  vpc_id      = module.vpc.vpc_id_out
  environment = var.environment
}

module "security_groups" {
  source      = "./modules/security_groups"
  account_id  = var.account_id
  vpc_id      = module.vpc.vpc_id_out
  environment = var.environment
}

#======================================================================================================================
# Resources deployed in the default VPC
#======================================================================================================================
module "dynamo_db" {
  source      = "./modules/dynamo_db"
  account_id  = var.account_id
  environment = var.environment
}