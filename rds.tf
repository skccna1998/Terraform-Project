resource "aws_db_instance" "WordPress-DB" {
  identifier             = "wordpress-db"
  allocated_storage      = 20
  db_name                = "wp_skdb"
  engine                 = "mysql"
  engine_version         = "8.4.8"
  instance_class         = "db.t3.micro"
  username               = "wp_suresh"
  password               = "wordpress"
  db_subnet_group_name   = aws_db_subnet_group.private_subnet_grp.name
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_nsg.id]

  tags = {
    Name = "WordPress-DB"
  }

}