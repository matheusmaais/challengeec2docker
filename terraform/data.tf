######################
#GET UBUNTO AMI NUMBER
######################
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

######################
#GET DEFAULT VPC ID
######################
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}