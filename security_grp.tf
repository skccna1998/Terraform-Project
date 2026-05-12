# Security group for webserver
resource "aws_security_group" "webserver_nsg" {
  name        = "allow_ssh_http"
  description = "Allow SSH & HTTP inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.VPC-01.id

  tags = {
    Name = "webserver_nsg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "webserver_nsg_ssh" {
  security_group_id = aws_security_group.webserver_nsg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "webserver_nsg_http" {
  security_group_id = aws_security_group.webserver_nsg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "webserver_nsg_all_traffic_ipv4" {
  security_group_id = aws_security_group.webserver_nsg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# Security group for RDS
resource "aws_security_group" "rds_nsg" {
  name        = "allow_MySQL"
  description = "Allow MySQL inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.VPC-01.id

  tags = {
    Name = "rds_nsg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "rds_nsg_mysql" {
  security_group_id = aws_security_group.rds_nsg.id
  cidr_ipv4         = "192.168.1.0/24"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

resource "aws_vpc_security_group_egress_rule" "rds_nsg_all_traffic_ipv4" {
  security_group_id = aws_security_group.rds_nsg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
