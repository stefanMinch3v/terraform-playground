provider "aws" {
  region = "eu-west-2"
}

variable "servernames" {
  type = list(string)
  default = [ "dev", "test", "prod" ]
}

module "ec2" {
  source = "./ec2"
  for_each = toset(var.servernames)
}