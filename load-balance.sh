#!/bin/sh

##########################################################################
# This script contains commands to create a load balancer that exposes an
# external IP address to run the deployed app from the outside world.
# The LoadBalancer service automatically decides which node to forward the
# request to as opposed to the NodePort type service which runs the app on
# the current node (and forwards the request to other nodes only if the
# current node does not have the app).
##########################################################################

# Creates a service object that exposes the deployment.
kubectl expose deployment ghost --type=LoadBalancer --name=ghost-load-balancer

# Query details regarding the created service.
kubectl get services ghost-load-balancer
kubectl describe service ghost-load-balancer

# Get the external IP and port from the above query commands.
EXTERNAL_IP = `kubectl get services ghost-load-balancer | grep ghost-load-balancer | awk '{print $3}'`
NODE_PORT = `kubectl describe service ghost-load-balancer | grep NodePort | tr -dc '0-9'`

# Send a request to the load balancer to run the webapp.
curl http://$EXTERNAL_IP:$PORT


