# Kubernetes

### Slide

https://docs.google.com/presentation/d/1_GtjEXAfknv9VJW_Re8xrMPSM1NR33J4wgX1uNCm438/edit?usp=sharing

### Scratch

https://docs.google.com/document/d/1GWdnvgtoqhpivx3t-jv1-OJBVFtdgcTqMylCCYfphgk/edit

KUBERNETES: 

Kubernetes is an open source system for automating the deployment, scaling and management of applications running on containers. 
Kubernetes is an open source container and cluster manager that was designed by Google and donated to the Cloud Native Computing Foundation.  It usually works with Docker Containers and manages the traffic in between the cluster of hosts that are running the Docker containers. 

History: 
It was founded by Joe Bada, Brendan Burns and Craig McLuckie and was founded by Google in 2014. 
The version v1.0 was launched on July 21, 2015. Later Google released the Cloud Native Computing Foundation (CNCF) through partnership with Linux Foundation and started offering Kubernetes as sees technology.  

Kubernetes: Advantages. 
•	Kubernetes has the following advantages: -  
•	Kubernetes has high scalability and can scale without increasing the ops team.  
•	Kubernetes has high flexibility as it allows you run a variety of applications irrespective of the complexity of the application.  
•	Kubernetes provide a public cloud infrastructure and allows you to run your applications from anywhere. 

Kubenetes has the following features: - 
Automatic binpacking: Places containers on their resource requirements while not sacrificing availability.  
Horizontal Scaling: Allows you to scale your application automatically with a simple command. 
Automated Rollouts and Rollbacks: It automatically roles out the changes to your application and rollsback the changes for you.  
Storage Orchestration: Mounts the required storage system from your local storage or a public cloud provider such as GCP and AWS and a network storage system like NFS.  
Self Healing: It can replace containers when they fail and replace and reschedule containers when the node dies and kill unresponsive containers.  
Service Discovery and Load Balancing: It can distribute the load across containers with their own IP addresses. 
Secret and Configuration Management: Deploy and update secrets and application configuration without building the image.  

Kubernetes Clusters: 
Kubernetes Clusters are a collection of computers each running an application that are coordinated and synchronized as a single unit. Kubernetes can deploy these applications to a cluster without tying them on a particular machine.  
These makes the applications more flexible and available. A cluster contains the following: -  
Master: It co-ordinates the cluster and manages all the applications like scheduling applications, maintaining the desired state and rolling out new updates. 
Nodes: It is a VM or a worker machine that acts as a worker machine on which the application runs. Every node runs a Kubelet which communicates the Kubernetes master. Every Node runs at least:-  
Kubelet: A process responsible for communication between the master and the nodes. 
A container run time responsible for pulling the container image from registry, unpacking the container and running the application.  

For Kubernetes development minikube can be used. It is a lightweight Kubernetes implementation that cam create a VM on your local machine and deploy a cluster containing one node in that. 

Deploying a Kubernetes Application: 
It is responsible for creating and updating instances of your application. The master schedules the application instances onto the nodes in a cluster. 
The deployment controller continuously monitors those instances. If the Node hosting it goes down or deleted the instance is replaced by the Deployment controller. This provides a self-healing mechanism and addressed machine failure and maintenance.  

Kubernetes Pods: 
Pod is an abstraction and it represents a group of one or more application containers and their shared resources. A Pod is a group of one or more application containers and includes shared IP addresses and information as to how to run them. The containers in a Pod are always co-located and co-scheduled and run in a shared context on the same Node.  
When we create Deployment, we create Pods with containers inside them. Each Pod is tied to the Node where it is scheduled and remains there until termination or deletion. 
A node can have multiple pods and the master automatically handles scheduling of pods across the Nodes in a cluster. 

Kubernetes Services: 
Kubernetes Service enables external traffic exposure, load balancing and service discovery. The abstraction exposes Pods to traffic originating from the cluster. This can be done in following ways: -  
Load Balancer: 	Provides a public IP address. 
Node Port: Exposes the Service on the same port on each Node of the cluster using NAT. 
Service provides load balancing of traffic across the Pods. Services are also responsible for service discovery within the cluster 
Services match a set of pods using Labels, a grouping which allows logical operation on Labels. Labels are key/value pairs that are attached to objects like Pods. They are used to organize related objects in a meaningful way based upon the Production environment, application version and type of service/server.  

Scaling the Application:  
Scaling is accomplished by changing the number of replicas in the Deployment. Scaling up a Deployment will ensure that new Pods are created and scheduled to Nodes with available resources. Scaling down will reduce the number of Pods to the new Desired state. Services have an integrated load balancer that will distribute the network traffic to all the Pods of an exposed Deployment. Once multiple instances are up and running, it is possible to do Rolling updates without any downtime.  

Performing a Rolling Update: 
Rolling Updates allow Deployments to occur with zero Run time by incrementally updating Pods with new ones. The new Pods will be scheduled on Nodes with available resources. Rolling updates allow the following: -  
Promote an application from one environment to another. 
Rolling back to previous versions.  
Continuous integration and Continuous delivery with zero downtime.  

Limitations of Kubernetes: 
It has a steep learning curve. 
Very limited options for local deployment and testing.  
It requires different deployment and installation steps for different deployment platforms.  
If you are using Kubernetes, you cannot use Docker CLI or Docker Compose to define new containers. 
Migration of Docker workflows to Kubernetes would require a complete rework.  

Kubernetes vs Docker Swarm: 
Docker Swarm has similar functionalities as compared to Kubernetes but uses standard Docker API and CLI. This is advantageous when using existing Docker workflows.  However Docker Swarm is limited by existing Docker functionalities and we cannot leverage other types of containers using Docker Swarm.  

### The following criteria will be used in evaluating your talk (each worth 5 points):

* summarize the main purpose of the tool?
* relate the tool to previously presented articles?
* present the tool in a clear, logical manner?
* critique the tool and present possible limitations?
* justify his or her own opinions about the tool?
* personalize the topic, such as by bringing in their own experiences?
* demonstrates how to use the tool with simple example?
* conveys value of tool in demonstration?
* facilitate a lively discussion of the tool?
* acts as an expert about the tool, answering clarifying questions as they arise?

### A repo and report describing tool will be also be graded on the following criteria:

* Provides a high level report about tool (10 points)
* Provides setup instructions (sample code, configuration files, install scripts) 20 points
* Provides a screencast or demo environment (e.g. virtual machine) using tool on a sample task (20 points).
