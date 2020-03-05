provider "aws" {
  version                 = "~> 2.51"
  region                  = var.aws_region
  shared_credentials_file = var.private_key_path
  profile                 = var.profile
}

data "aws_ami" "aws-linux-2" {
  most_recent   = true
  owners        = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_security_group" "allow_ssh" {
  name          = "test group name"
  description   = "allow ports for nginx"
  vpc_id        = aws_default_vpc.default.id

  ingress {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  ingress {
    from_port     = 80
    to_port       = 80
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  ingress {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test security group"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "test vpc"
  }
}

resource "aws_instance" "nginx" {
  ami                         = data.aws_ami.aws-linux-2.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = var.key_name

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
  }
}