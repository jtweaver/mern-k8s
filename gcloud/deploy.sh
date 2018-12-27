#!/usr/bin/env bash

echo "Connecting kubectl to GCloud"
gcloud container clusters get-credentials mern-k8s-cluster --zone us-central1-a --project mern-k8s
echo "Creating Mongo controller and service"
kubectl create -f mongo-controller.yaml
kubectl create -f mongo-service.yaml
echo "Creating Web controller and service"
kubectl create -f web-controller.yaml
kubectl create -f web-service.yaml
echo "Services created, waiting 60s for startup"
sleep 60
kubectl get pods
gcloud compute forwarding-rules list