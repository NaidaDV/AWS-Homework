resource "aws_subnet" "front_subnet_1" {
  vpc_id     = var.def_vpc_id
  cidr_block = "172.31.1.0/24"
  availability_zone = var.aws_AZ1
  map_public_ip_on_launch = true

  tags = {
    Name = "front_subnet_1"
  }
}


resource "aws_subnet" "front_subnet_2" {
  vpc_id     = var.def_vpc_id
  cidr_block = "172.31.2.0/24"
  availability_zone = var.aws_AZ2
  map_public_ip_on_launch = true

  tags = {
    Name = "front_subnet_2"
  }
}  


resource "aws_subnet" "back_subnet_1" {
  vpc_id     = var.def_vpc_id
  cidr_block = "172.31.3.0/24"
  availability_zone = var.aws_AZ1
  map_public_ip_on_launch = false

  tags = {
    Name = "back_subnet_1"
  }
}  

resource "aws_subnet" "back_subnet_2" {
  vpc_id     = var.def_vpc_id 
  cidr_block = "172.31.4.0/24"
  availability_zone = var.aws_AZ2
  map_public_ip_on_launch = false

  tags = {
    Name = "back_subnet_2"
  }
}


resource "aws_subnet" "data_subnet_1" {
  vpc_id     = var.def_vpc_id 
  cidr_block = "172.31.5.0/24"
  availability_zone = var.aws_AZ1
  map_public_ip_on_launch = false

  tags = {
    Name = "data_subnet_1"
  }
}

resource "aws_subnet" "data_subnet_2" {
  vpc_id     = var.def_vpc_id
  cidr_block = "172.31.6.0/24"
  availability_zone = var.aws_AZ2
  map_public_ip_on_launch = false

  tags = {
    Name = "data_subnet_2"
  }
}
