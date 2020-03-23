###################
## Variables
###################

variable "region" {
  default = "us-east-1"
}

###################
## Data
###################

data "aws_ami" "aws-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

###################
## Providers
###################

provider "aws" {
  region = var.region
}

###################
## Resources
###################

resource "aws_instance" "primary_app_server" {
  ami           = data.aws_ami.aws-linux.id
  instance_type = "t2.micro"
}