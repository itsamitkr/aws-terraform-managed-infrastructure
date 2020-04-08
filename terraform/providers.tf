terraform {
  backend "s3" {
    profile         = "defualt"
    bucket          = "managed-infrastructure-tfstate"
    key             = "managed-infrastructure/terraform.tfstate"
    region          = "us-west-2"
  }
}

provider "aws" {
  version                 = "~> 2.20"
  profile                 = "default"
  shared_credentials_file = "~/.aws/credentials"
  region                  = "us-west-2"
}

