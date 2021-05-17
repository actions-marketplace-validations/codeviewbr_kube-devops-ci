

# Kube DevOps CI

[![kube-devops-ci](https://github.com/codeviewbr/kube-devops-ci/actions/workflows/docker-ci.yml/badge.svg)](https://github.com/codeviewbr/kube-devops-ci/actions/workflows/docker-ci.yml)

The most important tools for you to run in your infrastructure pipelines as code, whether in kubernt environments or not.

### Image Dockerhub:

```ssh
codeviewbr/kube-devops-ci:latest
```

### Kubernetes Tools

- KUBECTL=1.18.2
- KUSTOMIZE=3.5.5
- HELM_V2=2.16.7
- HELM_V3=3.2.1
- KUBEVAL=0.15.0
- KUBEAUDIT=0.11.5
- KUBESEAL=0.12.5
- KOPS=1.18.3
- TERRAFORM=0.15.3
- AWSCLI=1.19.73

### Variables
 
```yaml
CA=""
SERVER=""
CONTEXT=""
CLUSTER=""
NAMESPACE=""
USERNAME=""
TOKEN=""
AWS_REGION=""
AWS_ACCESS_KEY=""
AWS_SECRET_KEY=""
CLUSTER_NAME=""
KOPS_STATE_STORE=""
DOCKER_USERNAME=""
DOCKER_PASSWORD=""
```