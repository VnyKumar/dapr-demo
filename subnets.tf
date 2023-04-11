

# # Create internet gateway
# resource "aws_internet_gateway" "example_gateway" {
# }

# # Create public subnet
# resource "aws_subnet" "public_subnet" {
#   vpc_id            = "${aws_vpc.example_vpc.id}"
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "ap-south-1a"
# }

# # Create private subnets
# resource "aws_subnet" "private_subnet_1" {
#   vpc_id            = aws_vpc.example_vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "ap-south-1b"
# }

# resource "aws_subnet" "private_subnet_2" {
#   vpc_id            = aws_vpc.example_vpc.id
#   cidr_block        = "10.0.3.0/24"
#   availability_zone = "ap-south-1c"
# }

# resource "aws_subnet" "private_subnet_3" {
#   vpc_id            = aws_vpc.example_vpc.id
#   cidr_block        = "10.0.4.0/24"
#   availability_zone = "ap-south-1a"
# }

# # Create internet gateway attachment
# resource "aws_internet_gateway_attachment" "example_gateway_attachment" {
#   vpc_id             = aws_vpc.example_vpc.id
#   internet_gateway_id = aws_internet_gateway.example_gateway.id
# }

# # Create route table for public subnet
# resource "aws_route_table" "public_route_table" {
#   vpc_id = aws_vpc.example_vpc.id
# }

# # Create route to internet gateway
# resource "aws_route" "public_route" {
#   route_table_id         = aws_route_table.public_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.example_gateway.id
# }

# # Associate public subnet with public route table
# resource "aws_route_table_association" "public_subnet_association" {
#   subnet_id      = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.public_route_table.id
# }

# # Store Terraform state in an S3 bucket
