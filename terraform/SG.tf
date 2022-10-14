
resource "aws_security_group" "sg" {
  name        = "SSH and 8080"
  description = "SSH and 8080"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "Open port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "DevopsProject-SG"
  }
}