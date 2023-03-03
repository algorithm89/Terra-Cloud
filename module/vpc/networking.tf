resource "aws_vpc" "MainVpc" {
cidr_block       =  "${var.vpc_cidr}"
instance_tenancy =  "${var.tenancy}"
  tags = {
    Name = "Main VPC"
  }
}

resource "aws_subnet" "MainSub" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"
  availability_zone = "${vars.av_zone}"
  map_public_ip_on_launch = true
  tags = {
    Name = "Main VPC"
  }
}
resource "aws_internet_gateway" "igw-BRO" {
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "Main VPC"
  }
}

resource "aws_route_table" "rt" {
    vpc_id = "${var.vpc_id}"
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${vars.gw_id}"
    }
tags = {
        Name = "Public Subnet Route Table"
    }
}
resource "aws_route_table_association" "rt_associate_public" {
    subnet_id = "${vars.subnet_id}"
    route_table_id = aws_route_table.rt.id
}

output "vpc_id" {
    value = "${aws_vpc.MainVpc.id}"
  
}
output "subnet_id" {
    value = "${aws_subnet.MainSub.id}"
  
}

output "gw_id"{
value = "${aws_internet_gateway.igw-BRO.id}"

}
