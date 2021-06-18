provider "aws" {
  version = "~> 2.0"
  region = "sa-east-1"
}

variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
  ami = "ami-07bfd9965e7b972d1"
  instance_type = "t2.micro"
  count = length(var.server_names)
  tags = {
    Name = var.server_names[count.index]
  }
}

output "PrivateIP" {
  value = aws_instance.db.*.private_ip
}