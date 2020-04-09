#======================================================================================================================
# Custom VPC and resources to be deployed in the VPC
#======================================================================================================================
module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
}

module "vpc_endpoint" {
  source      = "./modules/vpc_endpoint"
  aws_region  = data.aws_region.current.name
  vpc_id      = module.vpc.vpc_id_out
  environment = var.environment
}

module "subnets" {
  source             = "./modules/subnets"
  vpc_id             = module.vpc.vpc_id_out
  environment        = var.environment
  availabilty_zones  = data.aws_availability_zones.current.names
}

module "security_groups" {
  source                      = "./modules/security_groups"
  vpc_id                      = module.vpc.vpc_id_out
  vpc_cidr_block              = module.vpc.vpc_id_cidr_block
  inbound_cidr_range_private  = module.subnets.subnet-private-cidr-out
  inbound_cidr_range_public   = module.subnets.subnet-public-cidr-out
  environment                 = var.environment
}

module "internet_gateway" {
  source      = "./modules/intenet_gateway"
  vpc_id      = module.vpc.vpc_id_out
  environment = var.environment
}

module "elastic_ips" {
  source          = "./modules/elastic_ips"
  private_subnets = module.subnets.subnet-private-cidr-out
  environment     = var.environment
}

module "nat_gateway" {
  source          = "./modules/nat_gateway"
  elastic_ips     = module.elastic_ips.elastic-ips
  private_subnets = module.subnets.subnet-private-out
  environment     = var.environment
}

module "route_table" {
  source              = "./modules/route_tables"
  vpc_id              = module.vpc.vpc_id_out
  nat_gateway_id      = module.nat_gateway.nat_gatway_ids
  private_subnets     = module.subnets.subnet-private-cidr-out
  public_subnets      = module.subnets.subnet-public-cidr-out
  internet_gateway_id = module.internet_gateway.internet-gateway-id
  environment         = var.environment
}

module "rds" {
  source                  = "./modules/rds"
  vpc_id                  = module.vpc.vpc_id_out
  vpc_security_group_ids  = module.security_groups.security-group-rds
  db_subnet_group_name    = module.subnets.subnet-private-names
  environment             = var.environment
  db_username             = var.rds_username
  db_password             = var.rds_password
}

#======================================================================================================================
# Resources deployed outside the Custom VPC
#======================================================================================================================
module "dynamo_db" {
  source      = "./modules/dynamo_db"
  environment = var.environment
}

module "s3" {
  source      = "./modules/s3"
  environment = var.environment
  region      = data.aws_region.current.name
}