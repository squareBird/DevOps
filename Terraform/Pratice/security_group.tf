resource "aws_security_group" "sg_web" {
  name = "sg_web"
  description = "HTTP / SSH"
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = [0.0.0.0/0]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [0.0.0.0/0]
  }
}

resource "aws_security_group" "sg_db" {
  name = "sg_db"
  description = "Allow 3306 From WEB"
  ingress {
    from_port = 3306
    protocol = "tcp"
    to_port = 3306
    # 이렇게 하면 WEB->DB로 오는거 적용할 수 있는지 확인
    security_groups = [aws_security_group.sg_web]
  }
}