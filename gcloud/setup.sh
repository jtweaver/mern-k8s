#!/usr/bin/env bash

echo "Creating Cluster"
gcloud container \
  --project "mern-k8s" \
  clusters create "mern-k8s-cluster" \
  --zone "us-central1-a" \
  --machine-type "n1-standard-1" \
  --num-nodes "2" \
  --network "default"

echo "Creating persistent disk"
gcloud compute disks create \
  --project "mern-k8s" \
  --zone "us-central1-a" \
  --size 5GB \
  mongo-disk

echo "Resources creating... Please wait a few minutes before deployment"
