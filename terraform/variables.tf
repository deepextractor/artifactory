variable "region" {
  default = "eu-west-1"
}

variable "environment" {
  default = "test"
}

variable "account_id" {
  default = "769018977079"
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "vpc_identifier" {
  type = string
}

variable "vpc_subnet_ids" {
  type = list(string)
}