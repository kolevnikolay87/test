######################
### ROUTING TABLES ###
######################

### Public Subnet 1 - 172.16.1.0/24 ###
resource "aws_route_table" "rt_pub_sub-01" {
  vpc_id = aws_vpc.vpc_exam.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-01.id
  }

  tags = {
    Name = "routing-pub-sub-01"
  }
}
resource "aws_route_table_association" "pub_sub-01_assoc" {
  subnet_id      = aws_subnet.subnet_public_1a.id
  route_table_id = aws_route_table.rt_pub_sub-01.id
}


### Public Subnet 2 - 172.16.3.0/24 ###
resource "aws_route_table" "rt_pub_sub-02" {
  vpc_id = aws_vpc.vpc_exam.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-01.id
  }

  tags = {
    Name = "routing-pub-sub-02"
  }
}
resource "aws_route_table_association" "pub_sub-02_assoc" {
  subnet_id      = aws_subnet.subnet_public_1b.id
  route_table_id = aws_route_table.rt_pub_sub-02.id
}


### Private subnet 3 NO PUB IP - 172.16.4.0 ###
resource "aws_route_table" "rt_pri_sub-03" {
  vpc_id = aws_vpc.vpc_exam.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_no_pub.id
  }

  tags = {
    Name = "routing-pri-sub-03"
  }
}
resource "aws_route_table_association" "pri_sub-03_assoc" {
  subnet_id      = aws_subnet.subnet_private_1a.id
  route_table_id = aws_route_table.rt_pri_sub-03.id
}


### Private Subnet 4 PUB IP - 172.16.5.0/24 ###
resource "aws_route_table" "rt_pri_sub-04" {
  vpc_id = aws_vpc.vpc_exam.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_pub.id
  }

  tags = {
    Name = "routing-pri-sub-04"
  }
}
resource "aws_route_table_association" "pri_sub-04_assoc" {
  subnet_id      = aws_subnet.subnet_private_1b.id
  route_table_id = aws_route_table.rt_pri_sub-04.id
}
