resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/20"
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.128.0/20"

  tags = {
    Name = var.private_subnet_name
  }
}