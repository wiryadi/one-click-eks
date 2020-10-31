SHELL := /bin/bash

#check prerequisite
CHECK_AWS_CLI := $(shell command -v aws 2> /dev/null)
CHECK_EKSCTL := $(shell command -v eksctl 2> /dev/null)

#CONFIGURABLE
#KUBECONFIG_FILE := output/${CLUSTER_NAME}.kubeconfig
EC2_KEYPAIR ?= eksworkshop
AWS_REGION ?= ap-southeast-2
KMS_CMK_ALIAS ?= eksworkshop
CLUSTER_NAME ?= eksworkshop-eksctl

export KMS_CMK_ALIAS
export AWS_REGION
export EC2_KEYPAIR
export CLUSTER_NAME

.PHONY: verify create_all create_cluster \
	delete_all delete_vpc delete_iam delete_cluster delete_keypair

verify:
ifndef CHECK_AWS_CLI
	$(error "aws cli is not installed.")
else
	$(info "OK. aws cli detected")
endif
ifndef CHECK_EKSCTL
	$(error "eksctl is not installed.")
else
	$(info "OK. eksctl detected")
endif

setup:
	mkdir -p workspace

create_all: workspace/.create_cluster

create_cluster: workspace/.create_cluster
workspace/.create_cluster:
	src/scripts/create-cluster.sh

delete_cluster:
	src/scripts/delete-cluster.sh

clean:
	rm -rf workspace/*