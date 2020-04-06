terraform {
  backend "s3" {
    profile         = "defualt"
    bucket          = "managed-infrastructure-tfstate"
    key             = "managed-infrastructure/terraform.tfstate"
    region          = "us-west-2"
    dynamodb_table  = "managed-infrastructure-tfstate"
  }
}

provider "aws" {
  version                 = "~> 2.20"
  profile                 = "default"
  shared_credentials_file = "/Users/amitkumar/.aws/credentials"
  region                  = "us-west-2"
}

