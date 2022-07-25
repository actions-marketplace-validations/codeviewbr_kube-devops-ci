#!/usr/bin/env bash

set -o errexit

install_dep() {
apt-get update && \
apt-get install -y \
build-essential \
python \
python3-pip \
pip \
python-setuptools \
apt-transport-https \
ca-certificates \
curl \
groff \
less \
zip \
unzip \
sudo \
git \
wget \
bash \
make

AWS_CLI=""
echo "install awscli"
pip3 --no-cache-dir install --upgrade awscli
aws --version
}

install_kube_tools() {
KUBECTL=1.22.12
echo "downloading kubectl ${KUBECTL}"
curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL}/bin/linux/amd64/kubectl \
-o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
kubectl version --client

KUSTOMIZE=4.5.4
echo "downloading kustomize ${KUSTOMIZE}"
curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE}/kustomize_v${KUSTOMIZE}_linux_amd64.tar.gz | \
tar xz && mv kustomize /usr/local/bin/kustomize
rm -rf kustomize_v${KUSTOMIZE}_linux_amd64.tar.gz
kustomize version

HELM_V2=2.17.0
echo "downloading helm ${HELM_V2}"
curl -sSL https://get.helm.sh/helm-v${HELM_V2}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64
rm -rf helm-v${HELM_V2}-linux-amd64.tar.gz
helm version --client

HELM_V3=3.9.2
echo "downloading helm ${HELM_V3}"
curl -sSL https://get.helm.sh/helm-v${HELM_V3}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /usr/local/bin/helmv3 && rm -rf linux-amd64
rm -rf helm-v${HELM_V3}-linux-amd64.tar.gz
helmv3 version

KUBEVAL=0.16.1
echo "downloading kubeval ${KUBEVAL}"
curl -sL https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL}/kubeval-linux-amd64.tar.gz | \
tar xz && mv kubeval /usr/local/bin/kubeval
kubeval --version

KUBEAUDIT=0.19.0
echo "downloading kubeaudit ${KUBEAUDIT}"
curl -sSL https://github.com/Shopify/kubeaudit/releases/download/v${KUBEAUDIT}/kubeaudit_${KUBEAUDIT}_linux_amd64.tar.gz | \
tar xz && mv kubeaudit /usr/local/bin/kubeaudit
rm -rf kubeaudit_${KUBEAUDIT}_linux_amd64.tar.gz
kubeaudit --help

CONFTEST=0.33.2
echo "downloading conftest ${CONFTEST}"
curl -sL https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST}/conftest_${CONFTEST}_Linux_x86_64.tar.gz | \
tar xz && mv conftest /usr/local/bin/conftest
rm -rf conftest_${CONFTEST}_Linux_x86_64.tar.gz
conftest --version

KUBESEAL=0.18.1
echo "downloading kubeseal ${KUBESEAL}"
curl -sL https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL}/kubeseal-${KUBESEAL}-linux-amd64.tar.gz | \
tar xz && mv kubeseal /usr/local/bin/kubeseal
kubeseal --version

KOPS=1.18.3
echo "downloading kops cli ${KOPS}"
curl -sL https://github.com/kubernetes/kops/releases/download/v${KOPS}/kops-linux-amd64 \
-o /usr/local/bin/kops && chmod +x /usr/local/bin/kops
kops version
}

install_packages() {
echo "downloading yq"
curl -sL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
-o /usr/local/bin/yq && chmod +x /usr/local/bin/yq
yq --version

echo "downloading jq"
curl -sL https://github.com/stedolan/jq/releases/latest/download/jq-linux64 \
-o /usr/local/bin/jq && chmod +x /usr/local/bin/jq
jq --version
}

install_terraform() {
TERRAFORM=1.2.5
echo "downloading terraform ${TERRAFORM}"
wget https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip && \
unzip terraform_${TERRAFORM}_linux_amd64.zip && ls -lsa && mv terraform /usr/local/bin/ && chmod +x /usr/local/bin/terraform
rm -rf terraform_${TERRAFORM}_linux_amd64.zip
terraform -v
}

install_dep
install_kube_tools
install_packages
install_terraform 

sudo apt clean 