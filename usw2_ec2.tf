###################
## Resources
###################
resource "aws_instance" "primary_app_server_usw2" {
  provider      = aws.us_west_2
  ami           = data.aws_ami.centos7_usw2.id
  instance_type = "t2.micro"
}

data "aws_ami" "centos7_usw2" {
  provider    = aws.us_west_2
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS ENA 1803_01-b7ee8a69*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}