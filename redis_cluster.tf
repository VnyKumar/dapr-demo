# resource "aws_elasticache_subnet_group" "tf-redis" {
#   name       = "uc-redis"
#   subnet_ids = [ aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_3.id ]
# }

# resource "aws_security_group" "redis" {
#   name_prefix = "redis-"
#   vpc_id = aws_vpc.example_vpc.id
#   ingress {
#     from_port = 6379
#     to_port = 6379
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
    
#   }
# }

# resource "aws_elasticache_cluster" "tf-redis-cluster" {
#   cluster_id            = "uc-redis"
#   engine                = "redis"
#   engine_version        = "6.x"
#   node_type             = "cache.t3.micro"
#   num_cache_nodes       = 1
#   parameter_group_name  = "default.redis6.x"
#   port                  = "6379"
#   subnet_group_name     = aws_elasticache_subnet_group.tf-redis.name
#   security_group_ids    = [aws_security_group.redis.id]
#  # vpc_security_group_ids = [aws_security_group.redis.id]
#   #vpc_id                = aws_subnet.private_subnet_1.id
# }
