resource "aws_subnet" "public-subnets" {
  #count = 3
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-PublicSubnet-${count.index + 1}"
  }
}
#element(list, index)

resource "aws_subnet" "private-subnets" {
  #count = 3
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-PrivateSubnet-${count.index + 1}"
  }
}