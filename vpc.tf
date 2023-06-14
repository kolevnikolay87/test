###########################
########### VPC ###########
###########################

### Create VPC ###
resource "aws_vpc" "vpc_exam" {
  cidr_block = var.vpc_cidr
}
