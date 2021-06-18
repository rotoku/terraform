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
  
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}

variable "ingress_rules" {
  type = list(number)
  default = [ 80, 443 ]
}

variable "egress_rules" {
  type = list(number)
  default = [ 80, 443, 8080, 8443 ]
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