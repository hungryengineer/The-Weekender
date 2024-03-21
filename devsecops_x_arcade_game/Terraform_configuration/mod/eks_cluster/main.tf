resource "aws_eks_cluster" "arcade-eks" {
  count    = length(var.eks_name)
  name     = element(var.eks_name, count.index)
  role_arn = var.role_arn

  dynamic "vpc_config"{
    for_each = var.subnet_ids
    content {
        subnet_ids = element(var.subnet_ids, count.index)
    }
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  # will add dependency in modules section
#   depends_on = [
#     aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
#     aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
#   ]
}