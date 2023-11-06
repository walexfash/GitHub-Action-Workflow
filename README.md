**Introduction**

This task shows you how to deploy a Minikube Kubernetes cluster with a "Hello world" container.

The task will focus on:

● Deploy Minikube Cluster: Set up a Minikube Kubernetes cluster on a local
machine.
● Initial Container Deployment: Deploy the initial version of the "Hello world" container using Kubernetes manifests (Service and Deployment).
● GitHub Action Workflow: Create a GitHub Actions workflow to automate the deployment of the next semantic version of the container. This should include updating the version number.
● ArgoCD Configuration: Implement ArgoCD for continuous delivery and set up a GitOps workflow for Kubernetes cluster. The ArgoCD configuration should be based on a template.

**Deploy Minikube Cluster: Set up a Minikube Kubernetes cluster on a local machine.**
**Install minikube**

Install minikube via the instructions for various system platforms at https://minikube.sigs.k8s.io/docs/start/

Note
You need to cd into the mini-kube folder, open in powershell, install minikube, get the necessary VM (Virtual Machine) hypervisor.

Confirm that minikube is installed: run "minikube version"

You should see output similar to:

<img width="369" alt="image" src="https://github.com/walexfash/GitHub-Action-Workflow/assets/35840406/a5302214-7232-444d-8a4c-f9d6a9d8767a">

Start minikube using: "minikube start"

This may take a few minutes.

**Initial Container Deployment: Deploy the initial version of the "Hello world" container
using Kubernetes manifests (Service and Deployment).**

Check the hello-world script is running. You should see output similar to:

![image](https://github.com/walexfash/GitHub-Action-Workflow/assets/35840406/37361280-c3c4-425d-9d09-650ed23440ff)

If it deploys check the port and see if you will see hello world. You should see output similar to:

![image](https://github.com/walexfash/GitHub-Action-Workflow/assets/35840406/1c184add-2066-469c-9305-8e9464ef862b)

**GitHub Action Workflow: Create a GitHub Actions workflow to automate the deployment of the next semantic version of the container. This should include updating the version number.**

**Automated Workflow:** Whenever a workflow is said to be continuous, automation is a key principle attached with it. Continuity in flow means that the process is not stopping at any stage and is flowing smoothly.
Automation aims to minimize the human intervention for maximizing throughput and efficiency.

**Events for triggering GitHub Actions:** GitHub Actions are generally triggered after a specified event has occurred, event though they may also be invoked using schedulers etc.
Following events are important and commonly used:

1. push: A push event occurs when a file is created, deleted or modified and successfully synchronized with the 
   remote Git repository.
2. pull_request: A pull request is created when changes are made in a separate branch and sent for merging with the   
   main branch after review.
3. delete: A delete event occurs when a file is removed from the Git repository.
4. create: A create event occurs when a file is added in the Git repository.
5. issue: Whenever a issue is opened or closed, the GitHub event may be triggered.

In this task, GitHub Actions workflows configured to describe the steps in the workflow which are stored in YAML files. These files are located in a .github/workflows. I created a YAML file which will be read by Github Actions and it will automatically setup a workflow in development, staging and production environments. 

<img width="485" alt="Screenshot 1" src="https://github.com/walexfash/GitHub-Action-Workflow/assets/35840406/1674ca45-6aca-4c32-9de2-720112a5f6c9">

These are the output results after git push to the repository:

![image](https://github.com/walexfash/GitHub-Action-Workflow/assets/35840406/caa10f08-fa00-4b06-a5f1-6ab033bf2034)
![image](https://github.com/walexfash/GitHub-Action-Workflow/assets/35840406/e324e127-c8d5-4bbe-a5f2-08660857b3a0)
![image](https://github.com/walexfash/GitHub-Action-Workflow/assets/35840406/683b3bf9-a161-42ae-af46-6d363e09721a)

*********** Please note that I could not  update the container version because it did not work for me **********

**ArgoCD Configuration: Implement ArgoCD for continuous delivery and set up a GitOps workflow for your Kubernetes cluster. Your ArgoCD configuration should be based on a template.**

My plan is to implement these steps but I got error in step 4 that stoped me from continue the remaining steps:

# Step 1: Install ArgoCD
# Assuming you have kubectl configured to access a Kubernetes cluster
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Step 2: Configure ArgoCD
# Set up a port-forward to access the ArgoCD API server
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Retrieve the initial password for the admin user
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Access the ArgoCD UI by opening http://localhost:8080 in a browser
# Log in using the admin username and the password obtained above

# Step 3: Connect to Git repository
# In the ArgoCD UI, click on "New App" and provide the necessary details:
# - Application Name: Choose a name for my application
# - Project: Select the project or create a new one
# - Repository URL: Enter the URL of my Git repository
# - Path: Specify the path to my application manifests within the repository
# - Cluster URL: Enter the URL of my Kubernetes cluster
# - Namespace: Specify the target namespace for my application

# Step 4: Define applications
# In the ArgoCD UI, I will be able to define multiple applications by repeating Step 3 for each application I want to deploy

# Step 5: Set up GitOps workflow
# Make changes to my application manifests in the Git repository
# ArgoCD will automatically detect the changes and apply them to my Kubernetes cluster

# Step 6: Continuous delivery
# Configure my Git repository to trigger deployments whenever changes are pushed
# ArgoCD will automatically deploy new versions of my applications based on the changes in the repository






 


 
