
resource "aws_instance" "WEB" {
  count         = "${var.ec2_count}"  
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
 
}



