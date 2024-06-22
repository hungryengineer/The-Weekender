# The-Weekender
This repository contains the DevOps projects which closely mimic production grade features that I undertake on weekends as a hobby.

This is an end to end  DevSecOps implementation with below components:

1. Application code: classic snake game built on python
i) Application code *
ii) Pytest
iii) Dockerfile *
iv) Github packages *

2. DevSecOps tools:
i) EKS cluster *
ii) Istio Service mesh
iii) Terraform *
iv) Terratest *(integration pending)
v) Checkov *
vi) Argo CD
vii) GitHub actions *
viii) Trivy scan *
ix) OWASP 
x) Sonar cloud *
xi) Prometheus and Grafana

3. DNS services:
i) Route 53 Hosted zone
ii) GoDaddy Domain name
iii) AWS Certificate Manager (ACM) for SSL certs
iii) Kubernetes ExternalDNS
iv) IRSA
_________________________________________________________
# STEP 1 -- provisioning infra using terraform

Although we have end-to-end pipelines for creating and destroying infrastructure, however if need arises to manually create the infra then below pattern/sequence needs to be followed due to directed acyclic dependencies amongst resources:

Go to env folder:-
Step1. Create resources in network (init, plan, apply)
Step2. Create resources in iam (init, plan, apply)
Step3. Create resources in k8's (init, plan, apply)

To destroy the resources, reverse sequence is to be followed. If the sequence is not adhered to the the tf process will either result in error and fail or some resources might be orphaned and then would have to be deleted manually.

* Ensure that LB type services are deleted from the EKS cluster before the cluster is destroyed, if not LBs will be retained and will interfere in IGW destruction via TF pipeline.

# STEP 2 -- creating pipelines for terraform deployment *

# STEP 3 -- creating pipeline for building docker image using dockerfile and pushing it to GH Packages
# CI stage:    
    #build image from dockerfile 
    #push the image to GHP

# CD stage:
    #authenticate and login to eks cluster
    #set current cluster context
    #bake the helm chart into deployable manifests
    #deploy the manifests

** (pending: automate latest image pull into CD stage. For now, the workaround is to manually update the image:tag section of values.yaml based on latest tag in GHP)

# Gotchas:
1. when using resource "kubernetes_namespace" "namespace" to create namespace, it is unable to connect to the cluster, but when use local kubeconfig file and terraform applied locaaly, it is working fine. So the workaround for creating namespaces is using local executioner with a null resource 
