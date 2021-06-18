provider "aws" {
  version = "~> 2.0"
  region = var.region
}

module "db" {
    source = "./db"
    server_names = ["mariadb", "mysql", "mssql"]
}

output "private_ips" {
  value = module.db.PrivateIP
}