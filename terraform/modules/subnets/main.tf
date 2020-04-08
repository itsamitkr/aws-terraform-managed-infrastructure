#======================================================================================================================
# A Public and Private Subnet will be created in each AZ
# Set a "default" value to the "availabilty_zones" variable if you don't wish to change the subnets.
#======================================================================================================================
resource "aws_subnet" "subnet-private" {
  count             = length(var.availabilty_zones)
  vpc_id            = var.vpc_id
  availability_zone = element(var.availabilty_zones, count.index)
  cidr_block        = element(var.private_cidr_block, count.index)
  tags              = merge(var.default_tags,
                      map("Name", "${var.environment}-subnet-private-${element(var.availabilty_zones, count.index)}"))
}

resource "aws_subnet" "subnet-public" {
  count             = length(var.availabilty_zones)
  vpc_id            = var.vpc_id
  availability_zone = element(var.availabilty_zones, count.index)
  cidr_block        = element(var.public_cidr_block, count.index)
  tags              = merge(var.default_tags,
                      map("Name", "${var.environment}-subnet-public-${element(var.availabilty_zones, count.index)}"))
}
