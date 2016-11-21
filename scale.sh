#!/bin/sh

##########################################################################
# This script contains commands to scale a deployment into multiple pods
# so as to have multiple container instances ready to take requests.
# This process can only be automated in GCE, GKE and AWS.
##########################################################################

# Command to manually create 4 replicas of a deployed app.
kubectl scale deployment ghost --replicas=4

# The following commands are used to create an autoscaler which will
# automatically scale the application based on the CPU usage.

# The autoscaler functionality is currently only available for GKE, GCE
# and AWS deployments and will not work for our Vagrant deployment. Hence,
# these commands are listed just as examples.

# Set the minimum and maximum nodes for the autoscaler and enable it.
# Very useful for cloud hosting platforms where each node has a running
# cost associated with it.
export KUBE_AUTOSCALER_MIN_NODES=2
export KUBE_AUTOSCALER_MAX_NODES=5
export KUBE_ENABLE_CLUSTER_AUTOSCALER=true

# Create an autoscaler which will maintain 1 to 10 pods of the
# application and ensure an average CPU utilization across all pods
# to be around 50%.
kubectl autoscale deployment ghost --cpu-percent=50 --min=1 --max=10

# Get the list of all autoscalers and their status.
kubectl get hpa
