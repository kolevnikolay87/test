###############
### SUBNETS ###
###############

resource "aws_subnet" "subnet_public_1a" {
  vpc_id            = aws_vpc.vpc_exam.id
  cidr_block        = lookup(var.cidr_ranges, "public1")
  availability_zone = "eu-west-1a"
  tags = {
    name = "${lookup(var.subnet_type, "public")}-subnet"
  }
}

resource "aws_subnet" "subnet_public_1b" {
  vpc_id            = aws_vpc.vpc_exam.id
  cidr_block        = lookup(var.cidr_ranges, "public2")
  availability_zone = "eu-west-1b"
  tags = {
    name = "${lookup(var.subnet_type, "public")}--subnet"
  }
}

resource "aws_subnet" "subnet_private_1a" {
  vpc_id            = aws_vpc.vpc_exam.id
  cidr_block        = lookup(var.cidr_ranges, "private1")
  availability_zone = "eu-west-1a"
  tags = {
    name = lookup(var.subnet_type, "private")
  }
}

resource "aws_subnet" "subnet_private_1b" {
  vpc_id            = aws_vpc.vpc_exam.id
  cidr_block        = lookup(var.cidr_ranges, "private2")
  availability_zone = "eu-west-1b"
  tags = {
    name = lookup(var.subnet_type, "private")
  }
}