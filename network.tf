### CREATE IGW ###
### Internet GATEWAY ###
resource "aws_internet_gateway" "igw-01" {
  vpc_id = aws_vpc.vpc_exam.id

  tags = {
    Name = "main_gw"
  }
}

### CREATE Elastic IP ###
resource "aws_eip" "eip_01" {
  domain           = "vpc"
}

resource "aws_eip" "eip_02" {
  domain           = "vpc"
}

### CREATE NAT GW ###
resource "aws_nat_gateway" "nat_gw_pub" {
  allocation_id = aws_eip.eip_01.id
  subnet_id     = aws_subnet.subnet_public_1a.id
  tags = {
    Name = "NAT-01"
  }
}

resource "aws_nat_gateway" "nat_gw_no_pub" {
  allocation_id = aws_eip.eip_02.id
  subnet_id         = aws_subnet.subnet_public_1b.id
  tags = {
    Name = "NAT-02"
  }
}
