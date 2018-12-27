#!/usr/bin/env bash
#npm run build

eval $(minikube docker-env)
docker build -t mern-k8s-mongo ../db
docker build -t mern-k8s-server ../
