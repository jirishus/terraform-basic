###################
## Variables
###################

###################
## Data
###################

###################
## Providers
###################

# The default provider configuration
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region
provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

provider "aws" {
  alias  = "us_east_2"
  region = "us-east-2"
}

###################
## Resources
###################

resource "aws_vpc" "devops_usw2" {
  provider = aws.us_west_2
  # Specify primary CIDR block for this VPC
  cidr_block = "10.0.0.0/24"
}

resource "aws_vpc" "devops_use2" {
  provider = aws.us_east_2
  # Specify primary CIDR block for this VPC
  cidr_block = "10.0.0.0/24"
}

###################
## Outputs
###################

output "primary_vpc_usw2" {
  value = aws_vpc.devops_usw2.id
}

output "primary_vpc_use2" {
  value = aws_vpc.devops_use2.id
}