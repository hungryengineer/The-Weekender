resource "null_resource" "update_config_create_namespace" {
  triggers = {
    eks_ep = data.terraform_remote_state.arcade-k8s.outputs.eks_endpoint[0][0]
  }
  provisioner "local-exec" {
    command = <<-EOT
      aws eks --region ap-south-1 update-kubeconfig --name arcade-eks
      kubectl create namespace argo
      kubectl create namespace istio-system
      kubectl label namespace default istio-injection=enabled --overwrite

    EOT
}
}
# resource "null_resource" "create_namespace" {
#   triggers = {
#     eks_ep = data.terraform_remote_state.arcade-k8s.outputs.eks_endpoint[0][0]
#   }
#   provisioner "local-exec" {
#     command = "kubectl create namespace argo"
#   }
# }
# module "kubernetes_namespace" {
#     source = "../../mod/kubernetes_namespace"
#     namespaces = var.namespaces
#     depends_on = [ null_resource.update_config ]
# }