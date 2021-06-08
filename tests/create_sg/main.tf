provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.1.0"
  providers = {
    aws = aws
  }

  name = "tardigrade-security-group-testing"
  cidr = "10.0.0.0/16"
}

module "create_security_group" {
  source = "../../"
  providers = {
    aws = aws
  }

  name   = "tardigrade-security-group-testing"
  vpc_id = module.vpc.vpc_id
  tags = {
    environment = "testing"
  }
}
