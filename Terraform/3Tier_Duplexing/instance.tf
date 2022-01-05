# ssh-keygen -t rsa -b 4096 -C "fails9503@gmail.com" -f "$HOME/.ssh/web_admin" -N ""
resource "aws_key_pair" "keypair" {
  key_name = "keypair"
  public_key = file("~/.ssh/web_admin.pub")
}

# Jenkins instance
resource "aws_instance" "jenkins" {
  ami = var.ubuntu2004
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.id
  subnet_id = aws_subnet.public_subnet_01.id

  vpc_security_group_ids = [
    aws_security_group.sg_jenkins.id
  ]

  user_data = file("/user_data_jenkins.sh")

  tags = {
    Name = "Jenkins"
    Project = var.project
  }
}

# Make web instance
# Security group 22(ssh) / 80(http) from Any
resource "aws_instance" "web-01" {

  ami = var.amazon_linux
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.key_name
  subnet_id = aws_subnet.public_subnet_01.id

  vpc_security_group_ids = [
    aws_security_group.sg_web.id
  ]

  tags = {
    Name = "WEB-01"
    Project = var.project
  }

  root_block_device {
    volume_size = 10
  }

}

resource "aws_instance" "web-02" {

  ami = var.amazon_linux
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.key_name
  subnet_id = aws_subnet.public_subnet_02.id

  vpc_security_group_ids = [
    aws_security_group.sg_web.id
  ]

  tags = {
    Name = "WEB-02"
    Project = var.project
  }

  root_block_device {
    volume_size = 10
  }

}

resource "aws_instance" "was-01" {

  ami = var.amazon_linux
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.key_name
  subnet_id = aws_subnet.private_subnet_01.id

  vpc_security_group_ids = [
    aws_security_group.sg_was.id
  ]

  tags = {
    Name = "WAS-01"
    Project = var.project
  }

  root_block_device {
    volume_size = 10
  }

}

resource "aws_instance" "was-02" {

  ami = var.amazon_linux
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair.key_name
  subnet_id = aws_subnet.private_subnet_02.id

  vpc_security_group_ids = [
    aws_security_group.sg_was.id
  ]

  tags = {
    Name = "WAS-02"
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
  subnet_id = aws_subnet.db_subnet_01.id

  vpc_security_group_ids = [
    aws_security_group.sg_db.id
  ]

  tags = {
    Name = "DB-01"
    Project = var.project
  }

  root_block_device {
    volume_size = 10
  }


}

resource "aws_instance" "db-02" {

  ami = var.amazon_linux
  instance_type = "t2.micro"
  subnet_id = aws_subnet.db_subnet_02.id

  vpc_security_group_ids = [
    aws_security_group.sg_db.id
  ]

  tags = {
    Name = "DB-02"
    Project = var.project
  }

  root_block_device {
    volume_size = 10
  }


}