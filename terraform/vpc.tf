resource "aws_vpc" "vpc-reto" {
    cidr_block = "${var.vps_cidr}"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    tags = {
      Name = "VPS Reto Zebrands"
    }
}

resource "aws_subnet" "subnet-reto" {
      vpc_id = "${aws_vpc.vpc-reto.id}"
      cidr_block = "${var.subnet_cidr}"
      availability_zone = "${var.availability_zone}"
      tags = {
        Name = "Subnet Reto Zebrands"
      }
}

resource "aws_internet_gateway" "igw-reto" {
      vpc_id = "${aws_vpc.vpc-reto.id}"
      tags = {
        Name = "Internet Gateway Reto Zebrands"
      }
}

resource "aws_route_table" "rt-public-reto" {
      vpc_id = "${aws_vpc.vpc-reto.id}"
      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw-reto.id}"
      }
      tags = {
        Name = "Public Route Table Reto Zebrands"
      }
}

resource "aws_route_table_association" "rta-public-reto" {
    subnet_id = "${aws_subnet.subnet-reto.id}"
    route_table_id = "${aws_route_table.rt-public-reto.id}"
}
