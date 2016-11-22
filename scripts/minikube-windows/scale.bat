rem This script contains commands to scale a deployment into multiple pods
rem so as to have multiple container instances ready to take requests.
rem This process can only be automated in GCE, GKE and AWS.

rem Command to manually create 4 replicas of a deployed app.
kubectl scale deployment ghost --replicas=4

rem Get the number of pods - there should be 4 pods for the deployment above
kubectl get pods

rem The following commands are used to create an autoscaler which will
rem automatically scale the application based on the CPU usage.

rem The autoscaler functionality is currently only available for GKE, GCE
rem and AWS deployments and will not work for our Vagrant deployment. Hence,
rem these commands are listed just as examples.

rem Create an autoscaler which will maintain 1 to 10 pods of the
rem application and ensure an average CPU utilization across all pods
rem to be around 50%.
kubectl autoscale deployment ghost --cpu-percent=50 --min=1 --max=10

rem Get the list of all autoscalers and their status.
kubectl get hpa

rem Describe the autoscaler just created.
kubectl describe hpa
