# resource "aws_s3_bucket" "example" {
#   bucket = "uc-care-bucket-dev"

#   # Enable versioning on the bucket
#   versioning {
#     enabled = true
#   }

#   # Enable server-side encryption with AWS managed keys
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   # Configure lifecycle rules for objects in the bucket
#   lifecycle_rule {
#     id      = "example-lifecycle-rule"
#     prefix  = ""
#     enabled = true
#   }
# }