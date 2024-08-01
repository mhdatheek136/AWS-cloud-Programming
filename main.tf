terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}



provider "aws" {
  region  = var.region
}

# Define default VPC with tags
resource "aws_default_vpc" "webpage_vpc" {
  tags = {
    Name = "WebPage_vpc"
  }
}

# Define default subnets in different availability zones
resource "aws_default_subnet" "webpage_subnet" {
  count             = 3
  availability_zone = "us-east-2${element(["a", "b", "c"], count.index)}"

  tags = {
    Name = "WebPage_subnet-${element(["2a", "2b", "2c"], count.index)}"
  }
}
