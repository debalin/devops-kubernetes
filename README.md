# Kubernetes

Kubernetes is an open source system for automating the deployment, scaling and management of applications running on containers. Kubernetes is an open source container and cluster manager that was designed by Google and donated to the **Cloud Native Computing Foundation.**  It usually works with Docker Containers and manages the traffic in between the cluster of hosts that are running the Docker containers.

![kubernetes](https://github.com/debalin/devops-kubernetes/blob/master/res/kubernetes.png "kubernetes") 

## History 
It was founded by **Joe Bada**, **Brendan Burns** and **Craig McLuckie** at Google in 2014. 
The version v1.0 was launched on July 21, 2015. Later Google formed the **Cloud Native Computing Foundation (CNCF)** along with IBM, Docker and VMware through partnership with **Linux Foundation** and started offering Kubernetes as sees technology.

## How Kubernetes Works

### Kubernetes Clusters
Kubernetes Clusters are a collection of computers each running an application that are coordinated and synchronized as a single unit. Kubernetes can deploy these applications to a cluster without tying them on a particular machine.  
These makes the applications more flexible and available. A cluster contains the following:
* **Master**: It co-ordinates the cluster and manages all the applications within it by performing operations such as scheduling applications, maintaining the desired state and rolling out new updates.
* **Nodes**: It is a worker machine (that can be a virtual or a physical machine) on which the application runs. Every node runs a Kubelet which communicates the Kubernetes master.

![cluster](https://github.com/debalin/devops-kubernetes/blob/master/res/cluster.png "cluster") 

### Kubernetes Nodes
A node is a worker machine (that can be either virtual or physical) within the Kubernetes cluster. A cluster consists of many nodes on which the application instances are deployed to run. These nodes are managed by the master. Every node runs at least:  
* **Kubelet**: A process responsible for communication between the master and the nodes. 
* A container run time responsible for pulling the container image from registry, unpacking the container and running the application. 

![node](https://github.com/debalin/devops-kubernetes/blob/master/res/node.png "node") 

### Kubernetes Pods
A pod is an abstraction that represents a group of one or more application containers and their shared resources. It includes shared IP addresses and information as to how to run them. The containers in a pod are always co-located and co-scheduled and run in a shared context on the same node. 

When we deploy an instance of an application, we create a pod which includes the application container inside it. This pod is tied to the node where it is scheduled and remains there until termination or deletion. A node can have multiple pods and the master automatically handles scheduling of pods across the nodes in a cluster.

![pod](https://github.com/debalin/devops-kubernetes/blob/master/res/pod.png "pod") 

### Deploying a Kubernetes Application 
A deployment is responsible for creating and updating instances of your application. The master creates pods to host the application instances and schedules these pods onto the nodes in a cluster. 

The deployment controller continuously monitors those instances by sending regular pings to check node health and tracking resource usage of the pod. If the node hosting it goes down or is deleted, the instance is replaced by the deployment controller. This provides a self-healing mechanism and addresses machine failure and maintenance. 

![deployment](https://github.com/debalin/devops-kubernetes/blob/master/res/deployment.png "deployment") 

### Kubernetes Services
A Kubernetes Service is an abstraction layer for a set of pods. It enables external traffic exposure, load balancing and service discovery. Services are categorized into the following types:
* **ExternalName**: Maps the service to the contents of the `externalName` field by returning a `CNAME` record with its value. This does not set up any kind of proxy.
* **ClusterIP**: This is the default type of service that is in use for pods. It ensures that the service is reachable only from within the cluster and is closed to external traffic.
* **Node Port**: In addition to having an internal cluster IP, this exposes the service on a common port to each node in the cluster. This service can then be accessed using `<NodeIP>:<NodePort>` where `NodeIP` can be the IP of any node in the cluster and `NodePort` is the port that the service is exposed on (this is not the same as the internal cluster IP port).
* **Load Balancer**: 	In addition to having an internal cluster IP and exposing a service on the NodePort, this asks the cloud provider to provide a load balancer that forwards to the service based on the `<NodeIP>:<NodePort>` for each node.

![service](https://github.com/debalin/devops-kubernetes/blob/master/res/service.png "service") 

### Scaling the Application
Initially when we create a deployment, we create only one pod for a single application instance. When traffic increases we need to scale the deployment to spawn up multiple pods to service requests. Scaling is accomplished by changing the number of replicas in the deployment. 

Scaling up a deployment will ensure that new Pods are created and scheduled to nodes with available resources. Scaling down will reduce the number of pods to the new desired state. Services have an integrated load balancer that will distribute the network traffic to all the pods of an exposed deployment. Once multiple instances are up and running, it is possible to do rolling updates without any downtime.

Kubernetes has a method to auto-scale an application based on the resource utilization. This is done using the **Horizontal Pod Autoscaler**. The HPA adjusts the number of pod replicas in the application controller based on the observed CPU utilization on each pod. It attempts to create enough pods to maintain an average CPU utilization specified by the user while within the boundaries of a minimum and maximum possible pod count specified by the user.

![scale](https://github.com/debalin/devops-kubernetes/blob/master/res/scale.png "scale") 

### Performing a Rolling Update
Rolling Updates allow deployments to occur with zero run time by incrementally updating pod instances with new ones. The new pods will be scheduled on nodes with available resources. Rolling updates allow the following actions:  
* Promote an application from one environment to another.
* Rolling back to previous versions.
* Continuous integration and continuous delivery with zero downtime.

![update1](https://github.com/debalin/devops-kubernetes/blob/master/res/update1.png "update1") 

![update2](https://github.com/debalin/devops-kubernetes/blob/master/res/update2.png "update2") 

## Minikube

Kubernetes is intended for production-grade environments. It is difficult to actually get a Kubernetes cluster deployed locally for development and testing purposes. The easiest way to set this up is to use **minikube**. It is a lightweight Kubernetes implementation that can create a VM (inside VirtualBox) on your local machine and use that as a node in the cluster. Minikube can, however, create only single-node clusters and might be useful for initial small development purposes and is not intended to be used on the cloud.

## What problems does Kubernetes solve?
* Easy deployment of containerized applications.
* Scaling and auto-scaling of container replicas based on resource usage.
* Ensuring that a request routes to the correct container like a proxy.
* Ensuring that a request routes to the appropriate node based on how busy the nodes are like a load balancer.
* Perform self-healing by replacing container instances in nodes that fail or are deleted.
* Seamlessly roll out new features with rolling updates.
* Run the application on several cloud providers including GCE, GKE, AWS, Azure, Vagrant, vSphere and Rackspace.

Kubenetes has the following features:
* **Automatic binpacking**: Places containers on their resource requirements while not sacrificing availability.  
* **Horizontal Scaling**: Allows you to scale your application automatically with a simple command. 
* **Automated Rollouts and Rollbacks**: It automatically roles out the changes to your application and rollsback the changes for you.  
* **Storage Orchestration**: Mounts the required storage system from your local storage or a public cloud provider such as GCP and AWS and a network storage system like NFS.  
* **Self Healing**: It can replace containers when they fail and replace and reschedule containers when the node dies and kill unresponsive containers.  
* **Service Discovery and Load Balancing**: It can distribute the load across containers with their own IP addresses. 
* **Secret and Configuration Management**: Deploy and update secrets and application configuration without building the image.  

## Limitations of Kubernetes 
* It has a steep learning curve. 
* Very limited options for local deployment and testing.  
* It requires different deployment and installation steps for different deployment platforms.  
* If you are using Kubernetes, you cannot use Docker CLI or Docker Compose to define new containers. 
* Migration of Docker workflows to Kubernetes would require a complete rework.  

### Kubernetes vs Docker Swarm
Docker Swarm has similar functionalities as compared to Kubernetes but uses standard Docker API and CLI. This is advantageous when using existing Docker workflows.  However, Docker Swarm is limited by existing Docker functionalities and we cannot leverage other types of containers using Docker Swarm.

Lately, docker has been getting lots of updates which brings up a question of whether the effort of learning the Kubernetes commands and API, and updating to Kubernetes is really advantageous considering how easy it is to use Docker Swarm with existing docker workflows. Docker has been trying to catch up to the features given by Kubernetes and is closing the gap.

![swarm](https://github.com/debalin/devops-kubernetes/blob/master/res/swarm.png "swarm") 

## Link to Presentation Slides

https://docs.google.com/presentation/d/1_GtjEXAfknv9VJW_Re8xrMPSM1NR33J4wgX1uNCm438/edit?usp=sharing
