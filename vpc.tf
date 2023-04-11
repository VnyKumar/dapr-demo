# Create VPC
resource "aws_vpc" "unify-care-vpc" {
  cidr_block = var.vpc-cidr
  tags = {

    Name="terraform-vpc-uc"
    
  }
  
}