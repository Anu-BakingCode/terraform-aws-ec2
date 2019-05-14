resource "aws_default_security_group" "default"{

    vpc_id = "${data.aws_vpc.default.id}"

# HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# SSH access from specific ip
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["35.169.106.126/32" , "180.151.15.234/31" , "180.151.78.236/30" , "180.151.78.218/31" , "180.151.78.222/32" , "180.151.78.220/31","182.74.4.226/32"]
  }

# Database access from specific ip
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["180.151.15.236/30", "180.151.15.234/31","180.151.78.218/31", "180.151.78.220/31" , "180.151.78.222/32"]
  }  

# Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
