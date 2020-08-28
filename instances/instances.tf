data "aws_subnet" "get-subnet1-id" {
  filter {
    name   = "tag:Name"
    values = ["front_subnet_1"]
  }
}
###########################################
data "aws_subnet" "get-subnet2-id" {
  filter {
    name   = "tag:Name"
    values = ["front_subnet_2"]
  }
}
###########################################
data "aws_subnet" "get-subnet3-id" {
  filter {
    name   = "tag:Name"
    values = ["back_subnet_1"]
  }
}
###########################################
data "aws_subnet" "get-subnet4-id" {
  filter {
    name   = "tag:Name"
    values = ["back_subnet_2"]
  }
}
###########################################
data "aws_subnet" "get-subnet5-id" {
  filter {
    name   = "tag:Name"
    values = ["data_subnet_1"]
  }
}
############################################
data "aws_subnet" "get-subnet6-id" {
  filter {
    name   = "tag:Name"
    values = ["data_subnet_2"]
  }
}
############################################
data "aws_security_group" "get-security1" {
  filter {
    name   = "tag:Name"
    values = ["back_data"]
  }
}
############################################
data "aws_security_group" "get-security2" {
  filter {
    name   = "tag:Name"
    values = ["front"]
  }
}
###########################################################
resource "aws_instance" "front1" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.get-subnet1-id.id
  key_name = var.auth
  security_groups = [ data.aws_security_group.get-security1.id ]
  iam_instance_profile = "TestRoleForInstance"
  user_data = file("script.sh")

  tags = {
    Name = "Front1"
  }
}
############################################
resource "aws_instance" "front2" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.get-subnet2-id.id
  key_name = var.auth
  security_groups = [ data.aws_security_group.get-security1.id ]
  iam_instance_profile = "TestRoleForInstance"
  user_data = file("script.sh")

  tags = {
    Name = "Front2"
  }
}

############################################
resource "aws_instance" "back1" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.get-subnet3-id.id
  key_name = var.auth
  security_groups = [ data.aws_security_group.get-security2.id ]
  iam_instance_profile = "TestRoleForInstance"
  user_data = file("script.sh")

  tags = {
    Name = "Back1"
  }
}
############################################
resource "aws_instance" "back2" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.get-subnet4-id.id
  key_name = var.auth
  security_groups = [ data.aws_security_group.get-security2.id ]
  iam_instance_profile = "TestRoleForInstance"
  user_data = file("script.sh")

  tags = {
    Name = "Back2"
  }
}
############################################
resource "aws_instance" "data1" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.get-subnet5-id.id
  key_name = var.auth
  security_groups = [ data.aws_security_group.get-security2.id ]
  iam_instance_profile = "TestRoleForInstance"
  user_data = file("script.sh")

  tags = {
    Name = "Data1"
  }
}
############################################
resource "aws_instance" "data2" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.get-subnet6-id.id
  key_name = var.auth
  security_groups = [ data.aws_security_group.get-security2.id ]
  iam_instance_profile = "TestRoleForInstance"
  user_data = file("script.sh")

  tags = {
    Name = "Data2"
  }
}
