### DEV CIDR ###############
vpc-cidr-block-dev = "10.97.0.0/16"

public-subnet-numbers-dev = {
  0 = "10.97.0.0/20"
  1 = "10.97.16.0/20"
  2 = "10.97.32.0/20"
}

private-subnet-numbers-dev = {
  0 = "10.97.48.0/20"
  1 = "10.97.64.0/20"
  2 = "10.97.80.0/20"
}

### STAGING CIDR ###############

vpc-cidr-block-staging = "10.1.0.0/16"

public-subnet-numbers-staging = {
  0 = "10.1.0.0/20"
  1 = "10.1.16.0/20"
  2 = "10.1.32.0/20"
}

private-subnet-numbers-staging = {
  0 = "10.1.48.0/20"
  1 = "10.1.64.0/20"
  2 = "10.1.80.0/20"
}

name         = "network"
project-name = "nashtech-devops"
owner        = "DungPA"
