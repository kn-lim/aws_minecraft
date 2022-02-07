terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_key_pair" "minecraft_key_pair" {
  key_name   = "${var.name}-key"
  public_key = file("${var.public_key}")
}

resource "aws_instance" "minecraft_ec2" {
  tags = {
    Name = var.name
  }

  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.minecraft_key_pair.key_name
  security_groups = [aws_security_group.minecraft_sg.name]

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("${var.private_key}")
  }

  provisioner "file" {
    source      = "scripts/setup.sh"
    destination = "/tmp/setup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup.sh",
      "/tmp/setup.sh ${var.server_url} ${var.java_max_memory}"
    ]
  }
}

data "aws_route53_zone" "minecraft_zone" {
  name = var.route53_zone
}

resource "aws_route53_record" "minecraft_record" {
  name    = var.cname
  zone_id = data.aws_route53_zone.minecraft_zone.zone_id
  type    = "CNAME"
  ttl     = "300"
  records = [aws_instance.minecraft_ec2.public_ip]
}
