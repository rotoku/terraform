provider "aws" {
  version = "~> 2.0"
  region = var.region
}

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.web_traffic.name]
}

resource "aws_security_group" "web_traffic" {
  name = "Allow HTTPS"
  
  ingress = {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress = {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "(Required) Type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "region" {
  type = string
  default = "sa-east-1"
}

variable "ami" {
  type = string
  default = "ami-07bfd9965e7b972d1"
  description = "(Required) AMI to use for the instance."
}