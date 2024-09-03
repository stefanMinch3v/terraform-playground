variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  type = bool
  default = true
}

variable "mylist" {
  type = list(string)
  default = ["Value0", "Value1"]
}

variable "mymap" {
  type = map(string)
  default = {
    Key1 = "Value1",
    Key2 = "Value2"
  }
}

variable "inputname" {
  type = string
  description = "Set the name of the VPC"
}

variable "mytuple" {
  type = tuple([ string, number, string ])
  default = [ "cat", 10, "dog" ]
}

variable "myobject" {
  type = object({
    name = string,
    port = list(number)
  })
  default = {
    name = "Firewall"
    port = [ 22, 25, 80 ]
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "myvps" {
  cidr_block = "10.0.0.0/16"

  # tags = {
  #   Name = var.vpcname
  # }

  # tags = {
  #   Name = var.mylist[0]
  # }

  tags = {
    Name = var.mymap["Key1"]
  }
}

output "vpcid" {
  value = aws_vpc.myvps.id
}