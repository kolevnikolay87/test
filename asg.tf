##################
### Create ASG ###
##################
resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2
  vpc_zone_identifier = [ aws_subnet.subnet_private_1a.id, aws_subnet.subnet_private_1b.id ]
  target_group_arns = [ aws_lb_target_group.nginx.arn ]

  launch_template {
    id      = aws_launch_template.first_template.id
    version = "$Latest"
  }
}

### Create ASG Policy ###
resource "aws_autoscaling_policy" "the_policy" {
  name                   = "the-auto-policy"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 4
}
