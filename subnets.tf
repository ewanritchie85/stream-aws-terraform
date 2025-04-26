resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.ewan-vpc.id
  cidr_block = "10.0.0.0/20"
  map_public_ip_on_launch = true

  tags = {
    Name = "ewan-public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.ewan-vpc.id
  cidr_block = "10.0.128.0/20"

  tags = {
    Name = "ewan-private-subnet"
  }
}