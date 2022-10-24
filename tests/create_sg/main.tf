module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.18.0"

  name = "tardigrade-security-group-testing"
  cidr = "10.0.0.0/16"
}

module "create_security_group" {
  source = "../../"

  name   = "tardigrade-security-group-testing"
  vpc_id = module.vpc.vpc_id
  tags = {
    environment = "testing"
  }
}
