#!/usr/bin/env bash

gcloud container \
  --project "mern-k8s" \
  clusters delete "mern-k8s-cluster" \
  --zone "us-central1-a"
