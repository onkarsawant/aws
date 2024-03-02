terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.19"
        }
    }
    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"
}

data "aws_ami" "awslinux23" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
}

variable "configuration" {
    description = "ec2 configuration"
    default = [{}]
}


locals {
  serverconfig = [
    for srv in var.configuration : [
      for i in range(1, srv.no_of_instances+1) : {
        instance_name = "${srv.application_name}-${i}"
        instance_type = srv.instance_type
        # ami = srv.ami
      }
    ]
  ]
}


locals {
  instances = flatten(local.serverconfig)
}

resource "aws_instance" "example_server" {
  for_each = {for server in local.instances: server.instance_name =>  server}

  ami           = data.aws_ami.awslinux23.id
  instance_type = each.value.instance_type
  tags = {
    Name = "${each.value.instance_name}"
  }
}
