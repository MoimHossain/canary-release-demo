#!/bin/bash
ImageName=$1
ImageTag=$2


echo " "
echo "Build input $ImageName:$ImageTag received"

echo "Installing Flagger"
kubectl apply -k github.com/cloudoven/flagger/kustomize/linkerd

sed -i "s|IMAGE_NAME|$ImageName|" ./manifests/bocanary-deployment.yml
sed -i "s|IMAGE_VERSION|$ImageTag|" ./manifests/bocanary-deployment.yml

echo "Replaced manifest stamp.. now applying to kubernetes..."



kubectl apply -f ./manifests/namespace.yml
kubectl apply -f ./manifests/bocanary-deployment.yml
kubectl apply -f ./manifests/bocanary-service.yml
kubectl apply -f ./manifests/bocanary-ingress.yml
kubectl apply -f ./manifests/load-gen.yml

echo "Deploying Canary CRD for bocanry.."
kubectl apply -f ./manifests/bocanary-canary