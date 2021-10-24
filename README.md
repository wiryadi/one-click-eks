# one-click-eks
EKS play ground quick start

The source is from AWS EKS Workshop
This repo automate the creation and deletion of EKS cluster for training purpose.

Preparations:
1. Install the following utilities**
- kubectl
- awscli
- jq
- envsubst
- yq
2. You have AWS IAM user with Admin rights to create EKS resources
3. Configure aws cli default profile with the IAM user above
4. Setup KMS Customer Managed Key (CMK)
5. export the following environment variables with desired values
- export AWS_REGION=<your AWS region>
- export KMS_CMK_ALIAS=<>
- export CLUSTER_NAME ?= eksworkshop
