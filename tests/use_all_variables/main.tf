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

module "use_all_variables" {
  source = "../../"
  providers = {
    aws = aws
  }

  name   = "tardigrade-security-group-testing"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [
    {
      "from_port"   = "0",
      "to_port"     = "0",
      "protocol"    = "-1",
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      "from_port"   = "0",
      "to_port"     = "0",
      "protocol"    = "-1",
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  ]

  revoke_rules_on_delete = true
  tags = {
    environment = "testing"
  }
}
