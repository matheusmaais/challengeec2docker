resource "aws_iam_role" "iam" {
  name = "ec2_access_s3"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#needs to enable SSM
resource "aws_iam_role_policy_attachment" "node_insights" {
  role       = aws_iam_role.iam.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

#create instance profile using role to access a s3 bucket
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "DevopsProject-InstanceProfile"
  role = aws_iam_role.iam.name
}
