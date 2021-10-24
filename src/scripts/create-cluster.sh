#!/usr/bin/env bash

echo "working dir: $(pwd)"
echo  "KMS_CMK_ALIAS: ${KMS_CMK_ALIAS}"
echo  "AWS_REGION: ${AWS_REGION}"
export MASTER_ARN=$(aws kms describe-key --key-id alias/${KMS_CMK_ALIAS} --query KeyMetadata.Arn --output text)
envsubst < src/templates/cluster.yaml | eksctl create cluster -f -
