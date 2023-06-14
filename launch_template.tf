###################################
######### Launch Template #########
###################################

resource "aws_launch_template" "first_template" {
  name_prefix            = "terraform-launch-template-exam"
  image_id               = data.aws_ami.latest_amazon_linux.image_id
  instance_type          = var.ec2_type
  update_default_version = true
  vpc_security_group_ids = [ aws_security_group.nginx-sg.id ]
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name
  }

  user_data = base64encode(file("${path.module}/user_data.sh"))
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "exam-instances"
    }
  }
}
