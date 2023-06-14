### INSTANCES ###
resource "aws_iam_role" "ec2_ssm_role" {
  name = "ssm-mgmt-ec2-exam"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy_attachment" "ec2_ssm_policy_attachment" {
  name = "ec2-ssm-policy-attachment"
  roles = [ aws_iam_role.ec2_ssm_role.id ]
  policy_arn = var.ec2_ssm_policy_arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance"
  role = aws_iam_role.ec2_ssm_role.name
}
