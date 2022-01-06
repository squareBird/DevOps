resource "aws_security_group" "test_default" {
  ingress {
    from_port = 0
    protocol = "tcp"
    to_port = 65535
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default_sg"
    Project = var.project
  }
}