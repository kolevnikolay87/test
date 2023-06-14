### REGION ###
variable "region" {
  type = string
  description = "Default AWS region"
  #default = "eu-west-1"
}

### SUBNETS ###
variable "subnet_type" {
  default = {
    public  = "public"
    private = "private"
  }
}
variable "cidr_ranges" {
  default = {
    public1  = "172.16.1.0/24"
    public2  = "172.16.3.0/24"
    private1 = "172.16.4.0/24"
    private2 = "172.16.5.0/24"
  }
}

### INSTANCES ###
variable "ec2_type" {
  type = string
  description = "Default EC2 type"
  default = "t2.micro"
}

variable "image_name" {
  default     = "amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"
  type        = string
  description = "Amazon linux image name"
}

variable "ec2_ssm_policy_arn" {
  type = string
  description = "EC2 SSM Policy"
  default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

variable "vpc_cidr" {
  type = string
  description = "CIDR block of VPC"
  #default = "172.16.0.0/16"
}
