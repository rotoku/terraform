provider "aws" {
  version = "~> 2.0"
  region = "sa-east-1"
}

variable "ec2name" {
  type = string
}

resource "aws_instance" "db" {
  ami = "ami-07bfd9965e7b972d1"
  instance_type = "t2.micro"

  tags = {
      Name = var.ec2name
  }
}