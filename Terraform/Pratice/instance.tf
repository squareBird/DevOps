# ssh-keygen -t rsa -b 4096 -C "fails9503@gmail.com" -f "$HOME/.ssh/web_admin" -N ""
resource "aws_key_pair" "keypair" {
  key_name = "keypair"
  public_key = file("~/.ssh/web_admin.pub")
}

resource "aws_instance" "web-01" {

  ami = "ami-0a93a08544874b3b7"
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.key_name
  subnet_id = aws_subnet.main_public_subnet.id

  vpc_security_group_ids = [
    aws_security_group.sg_web.id
  ]

  tags = {
    Name = "WEB-01"
    Project = var.project
  }

}