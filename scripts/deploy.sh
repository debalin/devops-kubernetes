#!/bin/sh

##########################################################################
# This script contains commands to query the Kubernetes cluster, run a
# deployment and expose the deployment to the outside world.
##########################################################################

# Returns a list of the available nodes created by the install script.
kubectl get nodes

# Runs the deployment for the "ghost" docker image (hosted on DockerHub).
# To host your own app, you would need to build a docker image for your
# app and upload it to DockerHub.
kubectl run ghost --image=nginx --port=9090

# Returns a list of pods created by deployments.
# The above deployment should have created only 1 pod with 1 container within.
kubectl get pods

# The deployment has an internal IP and internal port but is not visible to
# the outside world.
# This creates a service to expose the deployment on a port
# (chosen by Kubernetes) to the outside.
kubectl expose deployment ghost --type="NodePort"

# Returns a list of services defined on deployments. There should be a service
# named ghost as created in the expose command above. The "External IP" field
# for that service will be defined as any node.
kubectl get services

# Gives a description of the service. We can see the external port here.
kubectl describe service ghost
