#!/bin/bash

aws eks --region ap-south-1 update-kubeconfig --name arcade-eks 
sleep 10
echo "creating namspace argo"
kubectl create namespace argo
