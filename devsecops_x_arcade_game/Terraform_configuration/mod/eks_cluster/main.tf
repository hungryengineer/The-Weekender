resource "aws_eks_cluster" "arcade-eks" {
  count    = length(var.eks_name)
  name     = element(var.eks_name, count.index)
  role_arn = element(var.role_arn, count.index)
  vpc_config {
    subnet_ids =     ["subnet-0c343c4c4f4ed89a3","subnet-0a12a192fcd691d74",]
  }

  # dynamic "vpc_config"{
  #   for_each = var.subnet_ids
  #   content {
  #       subnet_ids = [vpc_config.value]#var.subnet_ids[count.index] #element(var.subnet_ids, count.index) #var.subnet_ids
  #   }
  # }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  # will add dependency in modules section
#   depends_on = [
#     aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
#     aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
#   ]
}