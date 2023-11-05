#!/bin/sh


# Start Minikube cluster:
minikube start

#Deploy the manifests:
kubectl apply -f hello-deployment.yaml
kubectl apply -f hello-service.yaml

# Verify deployment and service:
kubectl get deployments
kubectl get services

# Access the application using the minikube service IP:
minikube service hello-world
