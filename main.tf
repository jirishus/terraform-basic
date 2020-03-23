###################
## Variables
###################

variable "region" {
  default = "us-east-1"
}


###################
## Providers
###################

provider "aws" {
  region = var.region
}