rem This script contains the initial steps required to install and configure
rem Minikube and its command line client kubectl

rem Install Minikube from https://github.com/kubernetes/minikube/releases

rem Install Kubectl from http://storage.googleapis.com/kubernetes-release/release/v1.4.0/bin/windows/amd64/kubectl.exe

rem Create a local Kubernetes cluster with one node using Minikube
minikube start
