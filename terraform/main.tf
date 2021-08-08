resource "aws_vpc" "vpc-reto" {
    cidr_block = "${var.vps_cidr}"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    tags = {
      Name = "VPS Reto Zebrands"
    }
}

resource "aws_subnet" "subnets-reto" {
      count = length(data.aws_availability_zones.azs.names)
      vpc_id = "${aws_vpc.vpc-reto.id}"
      cidr_block = "${element(var.subnets_cidr, count.index)}"
      availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
      tags = {
        Name = "Subnet ${count.index + 1} Reto Zebrands"
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
    count = length(var.subnets_cidr)
    subnet_id = "${element(aws_subnet.subnets-reto.*.id, count.index)}"
    route_table_id = "${aws_route_table.rt-public-reto.id}"
}
