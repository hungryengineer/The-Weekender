
module "arcade-eks" {
    source       = "../../mod/eks_cluster"
    eks_name     = var.eks_name[0]
    role_arn     = data.terraform_remote_state.arcade.outputs[*].eks_arcade_iam_role_arn
    subnet_ids   = data.terraform_remote_state.arcade.outputs[*].subnet_id

    # depends_on = [ data.terraform_remote_state.arcade.aws_iam_role_policy_attachment.arcade-Policy ]
}