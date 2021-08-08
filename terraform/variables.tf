variable "region" {
  default = "us-east-2"
}

variable "vps_cidr" {
  default = "192.168.0.0/16"
}

variable "subnets_cidr" {
  type = list
  default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}

data "aws_availability_zones" "azs" {}
