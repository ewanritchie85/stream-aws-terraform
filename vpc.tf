
resource "aws_vpc" "ewan-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ewan-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ewan-vpc.id

  tags = {
    Name = "ewan-gateway"
  }
}

