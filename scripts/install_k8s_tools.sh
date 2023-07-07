#!/bin/bash

KUBECTL_VERSION=1.27.0
KUSTOMIZE_VERSION=5.1.0
HELM_VERSION=3.10.2
KUBESEAL_VERSION=0.22.0

# install kubectl
curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /tmp/kubectl
sudo mv /tmp/kubectl /usr/local/bin/
sudo chmod +x /usr/local/bin/kubectl

# install kustomize
wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
tar xfz kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
rm -rf kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
sudo mv kustomize /usr/local/bin/

# install helm
curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz
cd /tmp
tar xfz helm-v${HELM_VERSION}-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/
sudo chmod +x /usr/local/bin/helm
rm -rf helm* linux-amd64

# install kubeseal
mkdir -p kseal; cd kseal
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz
tar xfz kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz
sudo mv kubeseal /usr/local/bin/
cd ..; rm -rf kseal

# install jq
sudo apt -y install jq
