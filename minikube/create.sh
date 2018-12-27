#!/usr/bin/env bash

kubectl config use-context minikube
kubectl run mern-k8s-mongo --image=mern-k8s-mongo --port=27017 --image-pull-policy=IfNotPresent
kubectl expose deployment mern-k8s-mongo --type=NodePort

kubectl run mern-k8s-server --image=mern-k8s-server --port=5000 --image-pull-policy=IfNotPresent
kubectl expose deployment mern-k8s-server --type=NodePort

echo "Starting MERN K8S pods..."
sleep 7
kubectl get pod
kubectl get service
kubectl get deployment
echo "Opening MERN application"
sleep 10
minikube service mern-k8s-server
minikube dashboard