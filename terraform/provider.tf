terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.21.0"
    }
  }
  required_version = "1.3.7"
}
provider "aws" {
  region = "ap-northeast-1"
}