# PUBLIC ###########################################

resource "aws_security_group" "public_security_group" {
  name        = "allow_web_ssh"
  description = "Allow HTTP and SSH inbound and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = var.public_security_group_name
  }
}
resource "aws_vpc_security_group_ingress_rule" "public_http_in" {
  security_group_id = aws_security_group.public_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "public_ssh_in" {
  security_group_id = aws_security_group.public_security_group.id
  cidr_ipv4         = locals.my_ip_cidr
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "public_all_out" {
  security_group_id = aws_security_group.public_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
}

# PRIVATE ####################################################

resource "aws_security_group" "private_security_group" {
  name        = "allow_web_ssh"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = var.private_security_group_name
  }
}
resource "aws_vpc_security_group_ingress_rule" "private_http_in" {
  security_group_id = aws_security_group.private_security_group.id
  cidr_ipv4         = "10.0.0.0/20"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "private_ssh_in" {
  security_group_id = aws_security_group.private_security_group.id
  cidr_ipv4         = "10.0.0.0/20"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "private_all_out" {
  security_group_id = aws_security_group.private_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
}