###########################
########### DATA ##########
###########################

### AZs ###
data "aws_availability_zones" "available_azs" {
  state = "available"
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = [var.image_name]
  }
}


### Policies ###
data "aws_iam_policy" "ec2_ssm_policy_arn" {
  arn = var.ec2_ssm_policy_arn
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
