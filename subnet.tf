# Create a Public Subnet
resource "aws_subnet" "VPC01-Public-SN" {
  vpc_id                  = aws_vpc.VPC-01.id
  cidr_block              = "192.168.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "VPC01-Public-SN"
  }
}

# Create a Private Subnet A
resource "aws_subnet" "VPC01-Private-SN01" {
  vpc_id            = aws_vpc.VPC-01.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "VPC01-Private-SN01"
  }
}

# Create a Private Subnet B
resource "aws_subnet" "VPC01-Private-SN02" {
  vpc_id            = aws_vpc.VPC-01.id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "VPC01-Private-SN02"
  }
}