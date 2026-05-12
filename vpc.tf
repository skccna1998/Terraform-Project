# Create a VPC-01
resource "aws_vpc" "VPC-01" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC-01"
  }
}

resource "aws_internet_gateway" "VPC01-IGW" {
  vpc_id = aws_vpc.VPC-01.id

  tags = {
    Name = "VPC01-IGW"
  }
}