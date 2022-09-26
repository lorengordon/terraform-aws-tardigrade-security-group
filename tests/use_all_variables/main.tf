module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.15.0"

  name = "tardigrade-security-group-testing"
  cidr = "10.0.0.0/16"
}

module "use_all_variables" {
  source = "../../"

  name   = "tardigrade-security-group-testing"
  vpc_id = module.vpc.vpc_id

  revoke_rules_on_delete = true

  tags = {
    environment = "testing"
  }

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
}
