provider "aws" {
    region = "eu-west-2"
}

resource "aws_instance" "web" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"

    tags = {
      Name = "Web server"
    }
}

data "aws_instance" "webserversearch" {
  filter {
    name = "tag:Name"
    values = ["Web server"]
  }
}

output "webservers" {
  value = aws_instance.webserversearch.availability_zone
}

# with data sources we can pull any information about the resources we want to
# more on the docs - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance.html