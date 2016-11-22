rem This script contains commands to query the Kubernetes cluster, run a
rem deployment and expose the deployment to the outside world.

rem Returns a list of the available nodes created by the install script.
kubectl get nodes

rem Runs the deployment for the "ghost" docker image (hosted on DockerHub).
rem To host your own app, you would need to build a docker image for your
rem app and upload it to DockerHub.
kubectl run ghost --image=docker.io/jocatalin/kubernetes-bootcamp:v1 --port=8080

rem Returns a list of pods created by deployments.
rem The above deployment should have created only 1 pod with 1 container within.
kubectl get pods

rem The deployment has an internal IP and internal port but is not visible to
rem the outside world.
rem This creates a service to expose the deployment on a port
rem (chosen by Kubernetes) to the outside.
kubectl expose deployment ghost --type="NodePort"

rem Returns a list of services defined on deployments. There should be a service
rem named ghost as created in the expose command above. The "External IP" field
rem for that service will be defined as any node.
kubectl get services

rem Gives a description of the service. We can see the external port here.
kubectl describe service ghost
