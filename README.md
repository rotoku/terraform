# Terraform

[Terraform](https://terraform.io)

```
terraform init

terraform plan

terraform apply

terraform destroy

## using specif env
terraform plan -var-file=dev.tfvars

## import exist id 
terraform import aws_vpc.myvpc2 vpc-03db7c242123456789


terraform apply -auto-aprove
data "aws_instance" "dbsearch" {
    filter {
        name    =   "tag:Name"
        values  =   ["DB Server"]
    }
}
output "dbservers" {
    value = data.aws_instance.dbsearch.availability_zone
}
```

## Enable Default Server Side Encryption

resource "aws_kms_key" "kms_key" {
    description = "This key is used to encrypt bucket objects"
    deletion_window_in_days = 10
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "s3_bucket"

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id = aws_kms_key.kms_key.arn
                sse_algorithm = "aws:kms"
            }
        }
    }
}
