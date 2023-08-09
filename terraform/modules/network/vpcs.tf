resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr-block
  enable_dns_hostnames = "true"

  # tags = var.tags
  tags = merge(
    var.tags,
    {
      Name = "${var.project}-${var.name}-${var.environment}-vpc"
    }
  )
}
