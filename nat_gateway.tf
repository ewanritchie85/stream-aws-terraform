resource "aws_nat_gateway" "nat" {
    connectivity_type = "public"
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_a.id

  tags = {
    Name = var.nat_gateway_name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}

resource "aws_eip" "nat_eip" {
  instance = aws_nat_gateway.nat.id
  domain   = "vpc"
}