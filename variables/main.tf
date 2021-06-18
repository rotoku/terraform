variable "name" {
  type = string
  default = "myvpc"
}

variable "enabled" {
  default = true
}

variable "sshport" {
  type = number
  default = 22
}

variable "httpport" {
  type = number    
  default = 80
}

variable "httpsport" {
  type = number  
  default = 443
}

variable "list_of_string" {
  type = list(string)
  default = ["Value1", "Value2", "Value3", "ValueN"]
}

variable "tags" {
  type = map(string)
  default = {
      "costcenter" = "abc123"
      "environment" = "dev"
      "community" = "ervil"
  }
}

variable "inputname" {
  type = string
  description = "Set the name of VPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  name = var.inputname
  tags = var.tags
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["value", 1, "value"]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
      name = "RTK"
      port = [22,80,443]
  }
}