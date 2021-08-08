variable "region" {
  default = "us-east-2"
}

variable "vps_cidr" {
  default = "192.168.0.0/16"
}

variable "subnet_cidr" {
  default = "192.168.1.0/24"
}

variable "availability_zone" {
  default = "us-east-2a"
}

variable "private_ip_instance" {
  default = "192.168.1.11"
  description = "IP Private instance in firt Subnets"
}

variable "ami_id" {
  default = "ami-00399ec92321828f5"
  description = "AMI ID for Ubuntu 20.04 LTS (Free tier eligible)"
}
