# The-Weekender
This repository contains the DevOps projects which closely mimic production grade features that I undertake on weekends as a hobby.

This is an end to end  DevSecOps implementation with below components:

1. Application code: classic snake game built on python
i) Application code
ii) Pytest
iii) Dockerfile
iv) Github packages

2. DevSecOps tools:
i) EKS cluster
iii) Terraform
iv) Terratest
v) Checkov
vi) Argo CD
vii) GitHub actions
viii) Trivy scan
ix) OWASP 
x) SonarQube
xi) Prometheus and Grafana

_________________________________________________________
# STEP 1 -- provisioning infra using terraform

Although we have end-to-end pipelines for creating and destroying infrastructure, however if need arises to manually create the infra then below pattern/sequence needs to be followed due to directed acyclic dependencies amongst resources:

Go to env folder:-
Step1. Create resources in network (init, plan, apply)
Step2. Create resources in iam (init, plan, apply)
Step3. Create resources in k8's (init, plan, apply)

To destroy the resources, reverse sequence is to be followed. If the sequence is not adhered to the the tf process will either result in error and fail or some resources might be orphaned and then would have to be deleted manually.

* for some reasons datasources can't populate the subnet id field required for eks provisioning, the workaround is to manually add the subnets before each run

# STEP 2 -- creating pipelines for terraform deployment *

# STEP 3 -- creating pipeline for building docker image using dockerfile and pushing it to GH Packages
