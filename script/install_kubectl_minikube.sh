#!/bin/bash

# Actualizar el sistema
sudo apt-get update && sudo apt-get upgrade -y

# Instalar kubectl
echo "Instalando kubectl..."
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo "kubectl instalado correctamente."

# Verificar la instalación de kubectl
kubectl version --client

# Instalar Minikube
echo "Instalando Minikube..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/
echo "Minikube instalado correctamente."

# Verificar la instalación de Minikube
minikube version

# Iniciar Minikube
echo "Iniciando Minikube..."
minikube start

echo "Instalación completada. Minikube está corriendo."
