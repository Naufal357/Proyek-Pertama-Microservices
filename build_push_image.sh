#!/bin/bash

# Inisiasi nama pengguna Docker Hub
DOCKER_USERNAME="naufalrozan"

# Inisiasi nama image dan tag
IMAGE_NAME="item-app"
IMAGE_TAG="v1"

# Membuat docker image dari dockerfile yang telah dibuat
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# Menampilkan daftar image di lokal
echo "Listing local Docker images..."
docker images

# Mengubah nama image agar sesuai dengan format Docker Hub
DOCKER_IMAGE="$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
docker tag $IMAGE_NAME:$IMAGE_TAG $DOCKER_IMAGE

# Login ke Docker Hub
echo "Logging in to Docker Hub..."
docker login

# Push image ke Docker Hub
echo "Pushing Docker image to Docker Hub..."
docker push $DOCKER_IMAGE

echo "Docker image successfully pushed"
