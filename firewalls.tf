# PUBLIC ###########################################

resource "aws_security_group" "public-firewall" {
  name        = "allow_web_ssh"
  description = "Allow HTTP and SSH inbound and all outbound traffic"
  vpc_id      = aws_vpc.ewan-vpc.id

  tags = {
    Name = "public-firewall"
  }
}
resource "aws_vpc_security_group_ingress_rule" "public-http-in" {
  security_group_id = aws_security_group.public-firewall.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "public-ssh-in" {
  security_group_id = aws_security_group.public-firewall.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "public-all-out" {
  security_group_id = aws_security_group.public-firewall.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
}

# PRIVATE ####################################################

resource "aws_security_group" "private-firewall" {
  name        = "allow_web_ssh"
  description = ""
  vpc_id      = aws_vpc.ewan-vpc.id

  tags = {
    Name = "private-firewall"
  }
}
resource "aws_vpc_security_group_ingress_rule" "private-http-in" {
  security_group_id = aws_security_group.private-firewall.id
  cidr_ipv4         = "10.0.0.0/20"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "private-ssh-in" {
  security_group_id = aws_security_group.private-firewall.id
  cidr_ipv4         = "10.0.0.0/20"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "private-all-out" {
  security_group_id = aws_security_group.private-firewall.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
}