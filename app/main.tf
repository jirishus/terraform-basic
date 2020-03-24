###################
## Variables
###################

# variable "region" {
#   default = "us-east-1"
# }

###################
## Data
###################
locals {
  env = terraform.workspace
}

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


###################
## Outputs
###################

output "terraform_workspace" {
  value = terraform.workspace
}