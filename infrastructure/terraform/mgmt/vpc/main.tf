terraform {
  backend "s3" {}
}

# Get the configured region
data "aws_region" "current" {}

# The mgmt vpc. This will house Jenkins.
resource "aws_vpc" "mgmt" {
  cidr_block = var.mgmt_vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = var.tags
}

# Main internet gateway for vpc
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mgmt.id

  tags = var.tags
}

# Set up route for internet gateway
resource "aws_route" "gw" {
  route_table_id = aws_vpc.mgmt.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_subnet" "mgmt_main" {
  vpc_id = aws_vpc.mgmt.id
  cidr_block = cidrsubnet(var.mgmt_vpc_cidr_block, 4, 1)
  # Concat the region with the az, ex us-west-2a
  availability_zone = "${data.aws_region.current.name}a"
  # We'll want to access resources in here, so give it a public ip
  map_public_ip_on_launch = true

  tags = var.tags
}