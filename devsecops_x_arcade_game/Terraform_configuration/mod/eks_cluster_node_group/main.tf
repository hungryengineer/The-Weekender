resource "aws_eks_node_group" "arcade_eks_node_group" {
  count           = length(var.node_group_name)
  cluster_name    = element(var.eks_name, 0)
  node_group_name = element(var.node_group_name, count.index)
  node_role_arn   = element(var.node_role_arn, count.index)
  subnet_ids      = element(var.subnet_ids, count.index)

  dynamic "scaling_config" {
    for_each = var.scaling_config
    content {
      desired_size = scaling_config.value.desired_size
      max_size     = scaling_config.value.max_size
      min_size     = scaling_config.value.min_size
    }
  }
  # dynamic "scaling_config" {
  #   for_each = var.scaling_config #? [1] : [0]
  #   content {
  #     desired_size = var.desired_size
  #     max_size     = var.max_size
  #     min_size     = var.min_size
  #   }
  # }

  dynamic update_config {
    for_each = var.update_config
    content {
        max_unavailable = update_config.value.max_unavailable
    }
  # }
# dynamic update_config {
#     for_each = var.update_config ? 1 : 0
#     content {
#         max_unavailable = var.max_unavailable

#     }
#   }
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  # will add dependency in modules section

#   depends_on = [
#     aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
#   ]
}
}