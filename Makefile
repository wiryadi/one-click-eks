SHELL := /bin/bash

#check prerequisite
CHECK_AWS_CLI := $(shell command -v aws 2> /dev/null)
CHECK_EKSCTL := $(shell command -v eksctl 2> /dev/null)

#use values from parent shell, otherwise use these default values
AWS_REGION ?= ap-southeast-2
KMS_CMK_ALIAS ?= eksworkshop
CLUSTER_NAME ?= eksworkshop

export KMS_CMK_ALIAS
export AWS_REGION
export CLUSTER_NAME

.PHONY: setup clean verify create_cluster delete_cluster

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

create_cluster: setup
	src/scripts/create-cluster.sh
	

delete_cluster:
	src/scripts/delete-cluster.sh

clean:
	rm -rf workspace/*