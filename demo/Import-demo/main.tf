provider "aws" {
    region = "eu-west-2"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc2" {
    cidr_block = "192.168.0.0/24"
}

# we manually go and create a new vps in aws with the ipv4 address 192.168.0.0/24 and save the output vpc id
# then we can map it to our local myvpc2 and leave terraform to manage it
# the commands for it is: terraform import aws_vpc.myvpc2 + the id of the created vpc from the aws UI, for instance vpc-123-312423-3453