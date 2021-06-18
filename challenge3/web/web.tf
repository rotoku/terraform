provider "aws" {
  version = "~> 2.0"
  region = "sa-east-1"
}

variable "ec2name" {
  type = string
}

resource "aws_instance" "web" {
  ami = "ami-07bfd9965e7b972d1"
  instance_type = "t2.micro"
  security_groups = [ module.sg.sg_name ]
  user_data = file("./web/server-script.sh")
  tags = {
      Name = var.ec2name
  }
}

output "pub_ip" {
  value = module.eip.PublicIP
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.web.id
}

module "sg" {
  source = "../sg"
}