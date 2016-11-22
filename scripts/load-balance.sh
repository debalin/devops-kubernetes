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

# Can run the webapp using http://<node_ip>/<node_port>
# node_ip: This is the IP address of any node in the cluster (it will be automatically routed to the correct node).
# node_port: This is the port number exposed which can be seen in the "NodePort" field in the describe service output.
