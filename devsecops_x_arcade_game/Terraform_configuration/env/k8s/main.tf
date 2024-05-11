
module "arcade-eks" {
    source       = "../../mod/eks_cluster"
    eks_name     = var.eks_name[0]
    role_arn     = data.terraform_remote_state.arcade-iam.outputs.eks_arcade_iam_role_arn[0]
    vpc_config   = var.vpc_config
    subnet_ids = flatten(data.terraform_remote_state.arcade-network.outputs.subnet_id)

    # depends_on = [ data.terraform_remote_state.arcade.aws_iam_role_policy_attachment.arcade-Policy ]
}

module "arcade-eks-node-group" {
    source = "../../mod/eks_cluster_node_group"
    eks_name          = var.eks_name[0]
    node_group_name   = var.node_group_name[0]
    node_role_arn     = data.terraform_remote_state.arcade-iam.outputs.eks_node_group_arcade_iam_role_arn[0]
    subnet_ids = flatten(data.terraform_remote_state.arcade-network.outputs.subnet_id)
    scaling_config    = var.scaling_config
    # desired_size = var.desired_size
    # min_size = var.min_size
    # max_size = var.max_size
    update_config     = var.update_config
    # max_unavailable = var.max_unavailable
    
    depends_on = [ module.arcade-eks ]
#   depends_on = [
#     aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
#   ]
}

module "kubernetes_namespace" {
    source = "../../mod/kubernetes_namespace"
    namespace = var.namespace
    depends_on = [ module.arcade-eks-node-group ]

}