# variable "instance_type" {
#   description = "Instance type for the EC2 instance"
#   type        = string
# }

# variable "ami_id" {
#   description = "AMI ID for the EC2 instance"
#   type        = string
# }

# variable "key_name" {
#   description = "Name of the key pair to use for the EC2 instance"
#   type        = string
# }

# variable "subnet_id" {
#   description = "ID of the subnet to launch the EC2 instance in"
#   type        = string
# }

variable "vpc-cidr" {
  description = "unifcare vpc-cidr value..."
  type = string
#  default = "10.0.0.0/16"  
  
}

variable "subne1-public" {
  description = "Public Subnet value"
  type = string
  default = "10.0.6.0/24"  
  
}
variable "app-subnet-1-private" {
  description = "App Subnet-1 Private"
  type = string
  default = "10.0.6.0/24"  
  
}

variable "app-subnet-2-private" {
  description = "App Subnet-2 Private"
  type = string
  default = "10.0.7.0/24"  
  
}
variable "db-subnet-3-private" {
  description = "App Subnet-3 Private"
  type = string
  default = "10.0.7.0/24"  
  
}
