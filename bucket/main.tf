provider "aws" {
  version = "~> 2.0"
  region = "sa-east-1"
}

resource "aws_s3_bucket" "this" {
  bucket    = var.name
  acl       = var.acl
  tags      = {
    
  }
}
