resource "aws_security_group" "security-group-private" {
  name        = "${var.environment}-security-group-private"
  description = "Allows traffic to private subnet"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTPS Access"
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = var.inbound_cidr_range_private
  }

  ingress {
    description = "Allow HTTP Access"
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = var.inbound_cidr_range_private
  }

  ingress {
    description = "Allow SSH Access"
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = var.inbound_cidr_range_private
  }

  egress {
    description = "Allow access to the world"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = var.outbound_cidr_range
  }

  tags = merge(var.default_tags, map("Name", "${var.environment}-security-groups-private"))
}

resource "aws_security_group" "security-group-public" {
  name        = "${var.environment}-security-group-public"
  description = "Allows traffic to public subnet"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTPS Access"
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = var.inbound_cidr_range_public
  }

  ingress {
    description = "Allow HTTP Access"
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = var.inbound_cidr_range_public
  }

  ingress {
    description = "Allow SSH Access"
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = var.inbound_cidr_range_public
  }

  egress {
    description = "Allow access to the world"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = var.outbound_cidr_range
  }

  tags = merge(var.default_tags, map("Name", "${var.environment}-security-groups-public"))
}

resource "aws_security_group" "security-group-rds" {
  name        = "${var.environment}-security-group-rds"
  description = "Allows traffic to RDS"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow Database Access from VPC"
    from_port   = 3306
    protocol    = "TCP"
    to_port     = 3306
    cidr_blocks = var.vpc_cidr_block
  }

  egress {
    description = "Allow access to the world"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = var.outbound_cidr_range
  }

  tags = merge(var.default_tags, map("Name", "${var.environment}-security-groups-public"))
}