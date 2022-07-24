# Kube DevOps CI
  [![Production](https://github.com/codeviewbr/kube-devops-ci/actions/workflows/docker-ci.yml/badge.svg)](https://github.com/codeviewbr/kube-devops-ci/actions/workflows/docker-ci.yml)
   
Run the main commands to deploy or build services like kubernetes and aws using CLI.

## DevOps Tools
- KUBECTL=1.22.12
- KUSTOMIZE=4.5.4
- HELM_V2=2.17.0
- HELM_V3=3.9.2
- KUBEVAL=0.16.1
- KUBEAUDIT=0.19.0
- KUBESEAL=0.18.1
- CONFTEST=0.33.2
- KOPS=1.18.3
- TERRAFORM=1.2.5
- AWSCLI=1.25.36

  

## Variables

**Kube/config**
```yaml
CA=""
SERVER=""
CONTEXT=""
CLUSTER=""
NAMESPACE=""
USERNAME=""
TOKEN=""
```

**AWS CLI**
```yaml
AWS_REGION=""
AWS_ACCESS_KEY=""
AWS_SECRET_KEY=""
```

**KOPS Admin**
```yaml
CLUSTER_NAME=""
KOPS_STATE_STORE=""
```

## Usage

```yaml
- name: aws-cli-get-instances
  uses: codeviewbr/kube-devops-ci@v0.2.62
  id: get-ec2
  env: 
	AWS_REGION: "us-east-1"
	AWS_ACCESS_KEY: ${{ secrets.AWS_ACCESS_KEY }}
	AWS_SECRET_KEY: ${{ secrets.AWS_SECRET_KEY }}  
  with:
    command: aws ec2 describe-instances --instance-ids i-1234567890abcdef0
```
> Save as secrets in Github Actions Environments Settings your repository