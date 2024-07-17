#!/bin/bash

terraform init
terraform validate
terraform apply -auto-approve

kubectl apply -f deployment.yaml --insecure-skip-tls-verify=true
kubectl apply -f service.yaml --insecure-skip-tls-verify=true
kubectl apply -f ingress.yaml --insecure-skip-tls-verify=true
