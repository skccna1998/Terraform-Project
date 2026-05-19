terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-1"
  access_key = "AKIA5KF6ICCDSYI7R7JP"
  secret_key = "mwJ5Hc3GImXrhpWMgKqXAQsyk/POZmH/sZKescOas"
}
