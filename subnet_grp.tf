resource "aws_db_subnet_group" "private_subnet_grp" {
  name       = "private_subnet_grp"
  subnet_ids = [aws_subnet.VPC01-Private-SN01.id, aws_subnet.VPC01-Private-SN02.id]

  tags = {
    Name = "private_subnet_grp"
  }
}