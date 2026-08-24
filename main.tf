provider "aws" {
region = "ap-south-1"
}

resource "aws_instance" "one" {
count = 3
ami = "ami-01a00762f46d584a1"
instance_type = "c7i-flex.large"
key_name = "vpcserver"
vpc_security_group_ids = ["sg-0fe5a9d3aa204663f"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "APPSERVER-1", "Monitoring server"]
}
