resource "aws_key_pair" "key-reto" {
  key_name = "class_key2"
  public_key = "${file("./ssh-key-reto.pem.pub")}"
}

resource "aws_security_group" "sg-reto" {
  name = "security_group_reto"
  description = "Allow Port to Connect to Isntance"
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

  #Port for Ingress Controller Nginx Kubernetes
  ingress {
    from_port   = 30000
    to_port     = 32000
    protocol    = "tcp"
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
    instance_type = "t3.small"
    subnet_id = "${aws_subnet.subnet-reto.id}"
    associate_public_ip_address = true
    private_ip = "${var.private_ip_instance}"
    key_name = "${aws_key_pair.key-reto.id}"
    vpc_security_group_ids = [
      "${aws_security_group.sg-reto.id}"
    ]
    user_data = "${file("./userdata.sh")}"

    provisioner "file" {
      source      = "../k8s"
      destination = "/home/ubuntu/k8s"
      connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = "${file("./ssh-key-reto.pem")}"
        host        = "${self.public_dns}"
      }
    }

    tags = {
      Name = "Instance Reto Zebrands"
      Env = "Dev"
    }
}

resource "aws_ebs_volume" "vol-reto" {
  availability_zone = "${var.availability_zone}"
  size = 8
  type = "gp2"

  tags = {
    Name = "Minikube"
  }
}

resource "aws_volume_attachment" "vatt-instance-reto" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.vol-reto.id}"
  instance_id = "${aws_instance.instance-reto.id}"
}
