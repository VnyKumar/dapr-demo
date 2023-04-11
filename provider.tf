terraform {
  backend "s3" {
    bucket = "uc-app-s3-state"
    key    = "terraform.tfstate"
    region = "ap-south-1" # Replace with your desired region
  }
}

provider "aws" {
  region = "ap-south-1" # Replace with your desired region
  # access_key = ""
  # secret_key = ""

}

