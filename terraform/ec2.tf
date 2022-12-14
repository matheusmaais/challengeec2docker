######################
#EC2 Instance
######################
resource "aws_instance" "web" {

  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.sg.name]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data            = <<EOF
#!/bin/bash 
sudo apt update && sudo apt install docker.io -y
  EOF

  provisioner "local-exec" {
    command = "echo Your instance URL ${aws_instance.web.public_ip}:8080 > public-ip.txt"
  }

  tags = {
    Name = "DevopsProjectEc2"
  }
  volume_tags = {
    Name = "DevopsProjectVolume"
  }
}