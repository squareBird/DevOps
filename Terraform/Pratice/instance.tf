# ssh-keygen -t rsa -b 4096 -C "fails9503@gmail.com" -f "$HOME/.ssh/web_admin" -N ""
resource "aws_key_pair" "keypair" {
  key_name = "keypair"
  public_key = file("~/.ssh/web_admin.pub")
}

# Make web instance
# Security group 22(ssh) / 80(http) from Any
resource "aws_instance" "web-01" {

  ami = var.amazon_linux
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.key_name
  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [
    aws_security_group.sg_web.id
  ]

  user_data = file("user_data_web.sh")

  tags = {
    Name = "WEB-01"
    Project = var.project
  }

  root_block_device {
    volume_size = 10
  }

}

# Make db instance
# Security group 3306(DB) from web instance
resource "aws_instance" "db-01" {

  ami = var.amazon_linux
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.key_name
  subnet_id = aws_subnet.private_subnet.id

  vpc_security_group_ids = [
    aws_security_group.sg_db.id
  ]

  tags = {
    Name = "DB-01"
    Project = var.project
  }

  root_block_device {
    volume_size = 20
  }


}