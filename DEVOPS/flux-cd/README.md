# flux-cd auto-deployer

This project demonstrates a GitOps-based deployment pipeline for a sample API application running on Kubernetes (with Minikube). It integrates **Flux CD** with **Helm** to achieve automated and declarative continuous delivery. Additionally, a custom Jenkins pipeline is used to automatically detect new Docker image versions and update the Git repository, which Flux then synchronizes with the cluster.

## Key Features
- **GitOps workflow** – the Kubernetes cluster state is driven entirely from a Git repository.  
- **Automated image updates** – Jenkins checks DockerHub for new image tags and commits updated HelmRelease manifests back to Git.  
- **Flux CD reconciliation** – Flux continuously monitors the Git repository and applies the desired state to the cluster.  
- **Self-hosted Minikube lab** – all deployments are tested and verified locally on Minikube, replicating a real-world GitOps setup.

### PIPELINE:

- Builds and pushes application images to DockerHub (`radeczu/apitestapp`)  
- Checks current deployed version (HelmRelease in Git repo)  
- Compares with the latest available version in DockerHub  
- If a new version is available, commits updated manifest back to GitHub  
- Flux CD reconciles and deploys the update to the cluster automatically

## Components
- **Flux CD** – GitOps operator for Kubernetes  
- **Helm** – package manager for Kubernetes manifests  
- **Jenkins** – pipeline for Docker image update detection and Git repo automation  
- **DockerHub** – container image registry  
- **Kubernetes (Minikube)** – local test cluster for GitOps workflow  
