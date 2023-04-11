

# # Define the PostgreSQL RDS instance
# resource "aws_db_instance" "uc_care_db" {
#   identifier            = "postgresql-instance"
#   allocated_storage     = 20
#   engine                = "postgres"
#   engine_version        = "13.4"
#   instance_class        = "db.t3.micro"
#   db_name               = "uc_care_db"
#   username              = "postgres"
#   password              = "password123"
#   parameter_group_name  = "default.postgres13"
#   skip_final_snapshot   = true
#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }

# # Define a security group for the PostgreSQL instance
# resource "aws_security_group" "postgresql" {
#   name_prefix = "postgresql-"
#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }
