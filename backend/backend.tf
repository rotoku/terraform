terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "rtk-remote-backend-2021"
    region = "sa-east-1"
    access_key = ""
    secret_key = ""
  }
}