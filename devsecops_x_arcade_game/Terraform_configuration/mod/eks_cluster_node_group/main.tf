resource "aws_eks_node_group" "arcade_eks_node_group" {
  count           = length(var.node_group_name)
  cluster_name    = var.eks_name
  node_group_name = element(var.node_group_name, count.index)
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  dynamic "scaling_config" {
    for_each = var.scaling_config
    content {
      desired_size = each.value.desired_size
      max_size     = each.value.max_size
      min_size     = each.value.min_size
    }
    
  }

  dynamic update_config {
    for_each = var.update_config
    content {
        max_unavailable = each.value.max_unavailable

    }
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  # will add dependency in modules section

#   depends_on = [
#     aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
#   ]
}