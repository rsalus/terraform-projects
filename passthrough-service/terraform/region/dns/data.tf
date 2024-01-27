########################################################################
#       Common Data
########################################################################

data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "aws_alb" "alb" {
  arn = var.alb_arn
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    SUB-Type = "Private"
  }
}
