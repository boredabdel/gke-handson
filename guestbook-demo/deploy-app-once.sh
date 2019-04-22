#!/bin/bash
kubectl apply -f manifests/deployments/redis-master-deployment.yaml
kubectl apply -f redis-slave/k8s/redis-slave-deployment.yaml
kubectl apply -f guestbook-app/k8s/guestbook-deployment.yaml

kubectl apply -f manifests/services/redis-master-service.yaml
kubectl apply -f manifests/services/redis-slave-service.yaml