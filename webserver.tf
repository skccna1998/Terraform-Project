resource "aws_instance" "webserver" {
  ami           = "ami-03a25ed280b358f5b"
  instance_type = "t3.micro"
  key_name      = "webserver_key"

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  subnet_id              = aws_subnet.VPC01-Public-SN.id
  vpc_security_group_ids = [aws_security_group.webserver_nsg.id]

  user_data = templatefile("${path.module}/wordpress.sh", {
    rds_endpoint = aws_db_instance.WordPress-DB.address
  })

  tags = {
    Name = "webserver"
  }
}