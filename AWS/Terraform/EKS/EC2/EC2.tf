resource "aws_instance" "bastion_host" {

  ami = "amazon linux"
  instance_type = "t2.micro"
  key_name = "keyname"
  subnet_id = "어떤 서브넷에 위치시킬 것인지"

  vpc_security_group_ids = [
    aws_security_group.sg_jenkins.id, "보안그룹 리스트"
  ]

  user_data = file("userdata 파일 넣는 부분인데 이걸 어떻게 하는 것일까 나도 잘 모르지만 일단 오케이")

  tags = {
    Name = "Bastion Server"
    Project = var.project
  }


  availability_zone = ""
}