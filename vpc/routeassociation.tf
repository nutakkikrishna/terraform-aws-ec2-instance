resource "aws_route_table_association" "public-subnet-assos" {
  #count = 3
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-public.id
}
#var.list[*].id - splat syntax

resource "aws_route_table_association" "private-subnet-assos" {
  #count = 3
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-private.id
}