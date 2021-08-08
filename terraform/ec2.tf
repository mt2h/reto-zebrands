resource "aws_key_pair" "key-reto" {
  key_name = "class_key2"
  public_key = "${file("./ssh-key-reto.pem.pub")}"
}

resource "aws_security_group" "sg-reto" {
  name = "security_group_reto"
  description = "Allow Ping, SSH, HTTP and HTTPS"
  vpc_id = "${aws_vpc.vpc-reto.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Ping, SSH, HTTP and HTTPS"
  }
}

resource "aws_instance" "instance-reto" {
    ami = "${var.ami_id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.subnet-reto.id}"
    associate_public_ip_address = true
    private_ip = "${var.private_ip_instance}"
    vpc_security_group_ids = [
      "${aws_security_group.sg-reto.id}"
    ]
    key_name = "${aws_key_pair.key-reto.id}"
    tags = {
      Name = "Instance for checking Reto Zebrands"
      Env = "testing"
    }
}
