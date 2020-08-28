data "aws_instance" "get-front1-id" {
  filter {
    name   = "tag:Name"
    values = ["Front1"]
  }
}

data "aws_instance" "get-front2-id" {
  filter {
    name   = "tag:Name"
    values = ["Front2"]
  }
}

data "aws_security_group" "get-security" {
  filter {
    name   = "tag:Name"
    values = ["front"]
  }
}

data "aws_subnet" "get-subnet1-id" {
  filter {
    name   = "tag:Name"
    values = ["front_subnet_1"]
  }
}

data "aws_subnet" "get-subnet2-id" {
  filter {
    name   = "tag:Name"
    values = ["front_subnet_2"]
  }
}
#################################################
resource "aws_elb" "loadbalancer" {
  name               = "appelb"
  security_groups = [ data.aws_security_group.get-security.id ]
  subnets = [ data.aws_subnet.get-subnet1-id.id, data.aws_subnet.get-subnet2-id.id ]
  #availability_zones = [ var.aws_AZ1, var.aws_AZ2 ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  
  instances                   = [data.aws_instance.get-front1-id.id, data.aws_instance.get-front2-id.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "app_elastic_load_balancer"
  }
}
