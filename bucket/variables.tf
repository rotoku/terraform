variable "name" {
  description   = "(Required) Bucket name."
  type          = string
}

variable "acl" {
  description   = "(Optional) The canned ACL to apply. Defaults to 'private'."
  type          = string
  default       = "private"
}

variable "kms" {
  description   = "(Optional) The canned ACL to apply. Defaults to 'private'."
  type          = string
  default       = "ARN do KMS criado pelo usuário."
}

variable "tags" {
  description   = "(Optional) A mapping of tags to assign to the bucket."
  type          = map(string)
  default       = {}
}