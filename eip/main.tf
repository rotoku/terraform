provider "aws" {
  version = "~> 2.0"
  region = var.region
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

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elastic_ip.public_ip
}