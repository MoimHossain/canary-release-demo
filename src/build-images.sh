#!/bin/bash
ImageName="webapp-netcore5"
ImageTag="1.0.1"


echo " "
echo "Build input $ImageName:$DockerImageTag received"


sed -i "s|CONTAINER_IMAGE_NAME|$ImageName|" ./CanaryRolloutApp/Helper.cs
sed -i "s|CONTAINER_IMAGE_VERSION|$ImageTag|" ./CanaryRolloutApp/Helper.cs
echo "Replaced source code stamp"
cat ./CanaryRolloutApp/Helper.cs

echo "┌┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┐"
echo "┊ Building images ($ImageName:$ImageTag)            │"
echo "└┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┘"

docker build -t moimhossain/$ImageName:$ImageTag -f ./CanaryRolloutApp/Dockerfile ./CanaryRolloutApp 



echo "┌┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┐"
echo "┊ Pushing images ($ImageName:$ImageTag)             │"
echo "└┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┘"
docker push moimhossain/$ImageName:$ImageTag