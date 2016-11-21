#!/bin/sh

##########################################################################
# This script contains the initial steps required to install and configure
# Kubernetes and its command line client kubectl
##########################################################################

# Define the number of nodes deployed by Kubernetes.
export NUM_NODES=2

# Define the platform on which to deploy.
# Possible values include gce (default), gke, aws, azure, vagrant, vsphere, rackspace.
export KUBERNETES_PROVIDER=vagrant

# Run the Kubernetes install script which installs Kubernetes.
# Also sets up a cluster based on the NUM_NODES and KUBERNETES_PROVIDER.
curl -sS https://get.k8s.io | bash

# Install kubectl - Kubernetes Command Line Client.
# For Linux.
wget https://storage.googleapis.com/kubernetes-release/release/v1.4.4/bin/linux/amd64/kubectl
chmod +x kubectl
alias kubectl=`pwd`/kubectl

# Set up the environment variable to point to kubectl's configuration file.
# This is populated by the Kubernetes install script above.
export KUBECONFIG=~/.kube/config
