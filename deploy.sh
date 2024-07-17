#!/bin/bash

terraform init
terraform validate
terraform apply

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml