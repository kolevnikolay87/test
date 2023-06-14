###########################
########### LB ############
###########################

# aws lb
resource "aws_lb" "nginx" {
  name               = "nk-lb-tf"
  # internal = false ---> points/reachable through the internet
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ aws_security_group.alb_sg.id ]
  subnets            = [ aws_subnet.subnet_public_1a.id, aws_subnet.subnet_public_1b.id ]

  # defaults to false. If TRUE, TF will not be able to delete it (via the API)
  enable_deletion_protection = false
}

# aws_lb_target_group
resource "aws_lb_target_group" "nginx" {
  name     = "nginx-alb-tg"
  port     = 80
  protocol = "HTTP"
  # vpc <-- from network.tf
  vpc_id   = aws_vpc.vpc_exam.id
}

# aws_lb_listener
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    # target_group is the group of VMs that we'll send the traffic and loadbalance to
    target_group_arn = aws_lb_target_group.nginx.arn
  }
}
