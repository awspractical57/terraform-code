provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Demo-server" {
  ami = "ami-08718895af4dfa033"
  instance_type = "t2.micro"
  key_name = "Mumbaikey.pem"
  security_groups = ["Demo-sg"]
}

resource "aws_security_group" "Demo-sg" {
  name = "demo-sg"
  description = "SSH Access"

  ingress {
    description = "SSH Access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    name = "ssh-port"
  }
}