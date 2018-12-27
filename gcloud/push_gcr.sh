#!/usr/bin/env bash

echo "Building image"
docker build -t mern-k8s ../
echo "Authorizing with GCloud"
gcloud auth login
gcloud components update

echo "Tagging image"
docker tag mern-k8s gcr.io/mern-k8s/mern-k8s

echo "Configuring Docker to use GCloud"
gcloud auth configure-docker
echo "Pushing image to GCR"
docker push gcr.io/mern-k8s/mern-k8s