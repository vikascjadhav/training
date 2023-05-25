##### Table of Contents  
1. [  Red Hat Trainings and Certification ](#RHCA)
2. [ Containerization & Virtulization ](#cont)
3. [ Containerization Tools ](#ctools)
4. [Orchestration Platform](#orch)
5. [Microprofile and Microservice](#micro)
6. [Cloud-Native Development with Quarkus](#cloud)
7. [Service Mesh](#mesh)
8. [Tools](#tools)

Containerization Tools
<a name="RHCA"></a>
## 1.  Red Hat Trainings and Certification

https://www.linkedin.com/pulse/journey-red-hat-certified-architect-rhca-vikas-jadhav/


[Red Hat® Certified Architect (RHCA®)](https://www.credly.com/badges/91b296a3-044b-4658-94b5-e49cf718fa58/public_url) </br>
[Red Hat® Certified Specialist in Building Resilient Microservices](https://www.credly.com/badges/eda513a3-9e5b-4ab2-87a3-c39aca8ba052/public_url) </br>
[Red Hat® Certified Specialist in Cloud-native Integration](https://www.credly.com/badges/76ee3579-483c-404b-bdfa-2930834cdf86/public_url) </br>
[Red Hat® Certified Specialist in Event-Driven Development with Kafka](https://www.credly.com/badges/d64f2665-8194-48f7-b97a-148ad80a462f/public_url) </br>
[Red Hat® Certified Cloud-Native Developer](https://www.credly.com/badges/6fdac8d6-ccbd-4a8f-888f-5c3280e485ad/public_url) </br>
[Microsoft Certified Azure Fundamentals](https://www.credly.com/badges/babbd469-488a-4196-84cb-0a2ed82577a1/public_url) </br>
[Red Hat® Certified Enterprise Application Developer](https://www.credly.com/badges/0be931d0-05a2-4229-bc3e-7ade897ad280/public_url) </br>
[Red Hat® Certified Specialist in Containers and Kubernetes](https://www.credly.com/badges/d22bcca6-3d8c-4d03-83f9-074efad6883b/public_url) </br>
[Red Hat® Certified Specialist in OpenShift Application Development](https://www.credly.com/badges/5f2c6e37-3540-4215-8c3e-191445f88d2f/public_url) </br>


<a name="cont"></a>
## 2. Containerization Technology & Virtulization Technology

  - A container is a set of one or more processes that are isolated from the rest of the system.
  
  - Traditional Apps have Physical host or VM as its runtime 
  - Container Apps have their own runtime environment as container
  
  ![image](https://github.com/vikascjadhav/training/assets/3233682/44406ae0-fc1c-4f48-92b1-4a69e6c79168)



<a name="ctools"></a>
## 3. Containerization Tools
### Podman and Docker

Podman is an open-source container engine that allows you to manage and run containers on Linux systems. </br>

#### key features of Podman
- Alternative to Docker
- Daemonless Architecture: Unlike docker which has **dockerd** daemon 
- Support rootless container
- command syntax is same as Docker [Podman commands](https://docs.podman.io/en/latest/Commands.html)
- supports **Dockerfile** and **Containerfile**

Example 


Below is child image Dockerfile - which uses [parent image](https://github.com/vikascjadhav/DO288-apps/blob/main/exam-EX288-practice/build-child-image-practice/httpd-parent-fixed/Dockerfile) and copies src/index.html content to DOCROOT of apache 
```
  FROM quay.io/vikacjadhav/httpd-parent:latest 
  LABEL custom-name=image-do288
  EXPOSE 8080
```

Building docker file and running docker image 
```
 podman build --format docker -t my-httpd-child .  
 podman run -d --name my-httpd-child -p 8080:8080 my-httpd-child
 sleep 5
 curl localhost:8080
```

Cleaning up container and image 
```
 podman stop my-httpd-child
 podman rm my-httpd-child
 podman rmi my-httpd-child
```
<a name="orch"></a>
## 4. Container Orchestration Platforms

- Orchestration vs Automation

- Container orchestration automates the deployment, management, scaling, and networking of containers

#### why we need them?
- limitations of Container technology to manage containers at scale

Orchestration platform will compare current state of k8s cluster and try to match it desired state of cluster

##### Container Orchestration Platforms
- ##### Kubernetes (k8s)
- ##### Redhat OpenShift Container Platform
  ![image](https://github.com/vikascjadhav/training/assets/3233682/202d7768-bb6f-4450-a71f-f2c0a3b59a59)


Everything in openshift is API  
- Example: **oc get** constructs the appropriate REST API request and sends it to the OpenShift API server to fetch the requested data.

```
  $oc get pods #retries all the pods in project/namespace
```

Openshift Resources:
1. Project (Namespace)
2. Pod
3. Deployment
4. Service
5. Route
6. ConfigMap
7. Secret
8. PersistentVolume
9. ImageStream

  
![image](https://github.com/vikascjadhav/training/assets/3233682/eac0a2b9-0fa8-43d0-801e-aca03bab73fc)


<a name="micro"></a>
## 5. Microprofile and Microservices
https://microprofile.io/
MicroProfile specification is a joint venture between the Eclipse Foundation and many large
vendors including Red Hat. The specification defines a platform that optimizes Java for a
microservices-based architecture and provides portability across multiple runtimes.

![image](https://github.com/vikascjadhav/training/assets/3233682/5b5350f5-2c1f-4c53-b409-91c4847f0eca)

<a name="cloud"></a>
## 6. Cloud Native Development

**Cloud-native** is a very general term that aims to describe technologies. These technologies
are designed to build and run scalable applications in public, private, and hybrid clouds.
Exa containers, microservices, Kubernetes, and other modern technologies serve as examples.

cloud-native Technologies enable - resiliency, maintainability, observability, and their
processes are automated to allow for frequent updates and deployments.


Quarkus is a cloud-native framework, which means that the main deployment
platform is the container. 
- Container first approach
- Developer Friendly
- Native Executables - using Graal VM ( Mandrel is open source verion of Graal)

<a name="mesh"></a>
## 7. Service Mesh

Side Car Proxy Pattern - Inside pod we run proxy container along with application container
![image](https://github.com/vikascjadhav/training/assets/3233682/1e0c49cf-378a-4494-b5ef-e104773cdbb3)





Service mesh is a technology designed to address microservice architecture problems. This technology abstracts developers from many of the microservice architectural problems.
- Development challenges - Service Discivery/Elasticity
- Security challenges - Since there is high degree of communication between service due to Architecture. Security should be implemented across services.
- Operation challenges - Microservices must be resilient to failures

![image](https://github.com/vikascjadhav/training/assets/3233682/8ae874b1-9147-4c13-874e-44938e6d5154)

![image](https://github.com/vikascjadhav/training/assets/3233682/660c725b-9f84-400b-b331-3c18253d8aa9)


### Istio 
 - Open source service mesh implementation 
### Maitra 
 - modified verions of Istio for Openshift

### We started with containerirization -> Orchestration -> Service mesh

<a name="tools"></a>
## 8. Tools List

- Kubernetes - is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.
- Helm - Helm is a popular package manager for Kubernetes that simplifies the deployment and management of applications and services on a Kubernetes cluster. 
- JKube -  Also known as Fabric8 Maven Plugin, is a collection of Maven plugins and tools that simplify the deployment of Java applications to Kubernetes and OpenShift clusters.
- Kiali - Kiali is an open-source observability tool designed for monitoring and visualizing the behavior of applications running on a Kubernetes cluster.
- Jaeger - Jaeger is an open-source distributed tracing system that helps developers monitor, profile, and troubleshoot complex microservices-based architectures.
- Grafana - Grafana is an open-source data visualization and monitoring platform that allows users to create interactive and customizable dashboards for analyzing and monitoring various data sources.
- Prometheus - Prometheus is an open-source monitoring and alerting system designed for collecting and analyzing metrics from various sources






