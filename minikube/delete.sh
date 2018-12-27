#!/usr/bin/env bash

kubectl config use-context minikube
kubectl delete service mern-k8s-mongo
kubectl delete deployment mern-k8s-mongo
kubectl delete service mern-k8s-server
kubectl delete deployment mern-k8s-server
echo "Deleting MERN K8S pods..."
sleep 3
kubectl get pod
kubectl get service
kubectl get deployment
