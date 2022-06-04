resource "aws_security_group" "test_default" {

  name = "test_sg"
  description = "test"
  vpc_id = aws_vpc.test.id

  ingress {
    from_port = 0
    protocol = "tcp"
    to_port = 65535
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
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