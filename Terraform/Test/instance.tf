# ssh-keygen -t rsa -b 4096 -C "fails9503@gmail.com" -f "$HOME/.ssh/web_admin" -N ""
resource "aws_key_pair" "keypair" {
  key_name = "keypair"
  public_key = file("~/.ssh/web_admin.pub")
}

resource "aws_instance" "webtest" {
  ami = var.ubuntu2004
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.id
  subnet_id = aws_subnet.public_sub.id

  vpc_security_group_ids = [
    aws_security_group.test_default.id
  ]

  user_data = file("user_data_web.sh")

  tags = {
    Name = "web_test"
    Project = var.project
  }
}