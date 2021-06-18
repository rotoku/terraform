provider "aws" {
  version = "~> 2.0"
  region = "sa-east-1"
}

resource "aws_kms_key" "dev" {
  description             = "infrakmssoin"
  deletion_window_in_days = 10
}