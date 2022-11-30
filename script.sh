#!/bin/bash

echo "Criando imagens..."
docker build -t adrianosingolani/dio-k8s-projeto01-backend:1.0 backend/.
docker build -t adrianosingolani/dio-k8s-projeto01-database:1.0 database/.

echo "Push das imagens..."
docker push adrianosingolani/dio-k8s-projeto01-backend:1.0
docker push adrianosingolani/dio-k8s-projeto01-database:1.0

echo "Criando serviços no cluster kubernetes..."
kubectl apply -f ./services.yml

echo "Realizando os deployments..."
kubectl apply -f ./deployment.yml