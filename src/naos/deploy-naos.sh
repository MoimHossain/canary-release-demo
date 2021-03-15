#!/bin/bash
ImageTag=$1
DockerPassword=$2

echo " "
echo "Build input $ImageTag received"

echo "Installing Flagger"
kubectl apply -k github.com/cloudoven/flagger/kustomize/linkerd

sed -i "s|IMAGE_VERSION|$ImageTag|" ./manifests/api.yml
sed -i "s|IMAGE_VERSION|$ImageTag|" ./manifests/frontend.yml

echo "Replaced manifest stamp.. now applying to kubernetes..."

kubectl apply -f ./manifests/namespace.yml
kubectl -n naos create secret docker-registry dockerhub --docker-server=https://index.docker.io/v1/ --docker-username=moimhossain --docker-password=$DockerPassword --docker-email=moimhossain@gmail.com

kubectl apply -f ./manifests/api.yml
kubectl apply -f ./manifests/frontend.yml

echo "Deploying Canary CRD for APP.."
kubectl apply -f ./manifests/api-canary.yml