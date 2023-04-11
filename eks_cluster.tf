# # Creating IAM role so that it can be assumed while connecting to the Kubernetes cluster.

# resource "aws_iam_role" "iam-role-eks-cluster" {
#   name               = "terraform-eks-cluster"
#   assume_role_policy = <<POLICY
# {
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#    "Effect": "Allow",
#    "Principal": {
#     "Service": "eks.amazonaws.com"
#    },
#    "Action": "sts:AssumeRole"
#    }
#   ]
#  }
# POLICY
# }

# # Attach the AWS EKS service and AWS EKS cluster policies to the role.

# resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSClusterPolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.iam-role-eks-cluster.name
# }

# resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSServicePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
#   role       = aws_iam_role.iam-role-eks-cluster.name
# }

# # Create security group for AWS EKS.

# resource "aws_security_group" "eks-cluster" {
#   name = "SG-eks-cluster"
#   # Use your VPC here
#   #vpc_id = "vpc-01f7d384899977af9"
#   # Outbound Rule
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   # Inbound Rule
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # Creating the AWS EKS cluster

# resource "aws_eks_cluster" "eks_cluster" {
#   name     = "terraformEKScluster"
#   role_arn = aws_iam_role.iam-role-eks-cluster.arn
#   version  = "1.22"
#   # Configure EKS with vpc and network settings 
#   vpc_config {
#     security_group_ids = ["${aws_security_group.eks-cluster.id}"]
#     # Configure subnets below
#     subnet_ids = ["subnet-09cdd004fc57499e3", "subnet-0a77f8606b32bcb14"]
#   }
#   depends_on = [
#     aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy,
#     aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy,
#   ]
# }

# # Creating IAM role for AWS EKS nodes with assume policy so that it can assume 

# resource "aws_iam_role" "eks_nodes" {
#   name               = "eks-node-group"
#   assume_role_policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# POLICY
# }

# resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.eks_nodes.name
# }

# resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.eks_nodes.name
# }

# resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = aws_iam_role.eks_nodes.name
# }

# # Create AWS EKS cluster node group

# resource "aws_eks_node_group" "node" {
#   cluster_name    = aws_eks_cluster.eks_cluster.name
#   node_group_name = "node_tuto"
#   node_role_arn   = aws_iam_role.eks_nodes.arn
#   #subnet_ids      = ["subnet-04f9b6661436cadd1", "subnet-029e04d156398b37d"]
#   subnet_ids = ["subnet-09cdd004fc57499e3", "subnet-0a77f8606b32bcb14"]
#   scaling_config {
#     desired_size = 1
#     max_size     = 1
#     min_size     = 1
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
#   ]
# }
