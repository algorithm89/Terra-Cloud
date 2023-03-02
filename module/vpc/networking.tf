resource "aws_vpc" "MainVpc" {
cidr_block       =  "${var.vpc_cidr}"
instance_tenancy =  "${var.tenancy}"
  tags = {
    Name = "Main VPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"
  tags = {
    Name = "Main VPC"
  }
}
resource "aws_internet_gateway" "GWBRO" {
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "Main VPC"
  }
}

resource "aws_internet_gateway_attachment" "AttachGW" {
  internet_gateway_id = "${var.gw_name.id}"
  vpc_id              = "${var.vpc_id}"
}

output "vpc_id" {
    value = "${aws_vpc.MainVpc.id}"
  
}

