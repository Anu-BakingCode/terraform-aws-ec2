
##################################################################
# Data sources to get VPC, subnet details 
##################################################################

data "aws_vpc" "default" {
  default = true
}


data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}



resource "aws_instance" "instance" {

  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "twoish-stage-key"
  subnet_id                   = "${element(data.aws_subnet_ids.all.ids, 0)}"
  security_groups             = ["${aws_default_security_group.default.id}"]
  tags   = {
    Name = "Twoish-Backend-Node"
    Env  = "Staging"
  }
}	

#resource "aws_eip" "eip-one" {
#  instance = "${aws_instance.instance.id}"
#  vpc      = true
#}

