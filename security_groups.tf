resource "aws_security_group" "minecraft_sg" {
  name        = "${var.name}-sg"
  description = "Allows SSH and Minecraft Access"

  tags = {
    Name = "${var.name}-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.personal_ip}/${var.personal_subnet}"]
  }

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
