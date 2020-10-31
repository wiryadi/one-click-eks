#!/usr/bin/env bash
echo "deleting EKS cluster: ${CLUSTER_NAME}"

eksctl delete cluster -n ${CLUSTER_NAME}