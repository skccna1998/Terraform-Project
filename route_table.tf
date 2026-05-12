# Create a Public Route Table
resource "aws_route_table" "VPC01-Public-RT" {
  vpc_id = aws_vpc.VPC-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.VPC01-IGW.id
  }

  tags = {
    Name = "VPC01-Public-RT"
  }
}

resource "aws_route_table_association" "VPC01-Public-RT-association" {
  subnet_id      = aws_subnet.VPC01-Public-SN.id
  route_table_id = aws_route_table.VPC01-Public-RT.id
}
