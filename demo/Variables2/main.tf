provider "aws" {
    region = "eu-west-2"
}

variable "number_of_servers" {
    type = number
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    count = var.number_of_servers
}

# then use terraform init, terraform plan -var-file=test.tfvars to spin up 2 servers or prod for 50 servers