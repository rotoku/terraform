provider "aws" {
  version = "~> 2.0"
  region = "sa-east-1"
}

module "db" {
  source = "./db"
  ec2name = "DB Server"
}

module "web" {
  source = "./web"
  ec2name = "Web Server"
}

output "PrivateIP" {
  value = module.db.PrivateIP
}

output "PublicIP" {
  value = module.web.pub_id
}