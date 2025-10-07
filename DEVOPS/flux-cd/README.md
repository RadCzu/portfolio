# flux-cd auto-deployer

This project demonstrates a GitOps-based deployment pipeline for a sample API application running on Kubernetes (with Minikube). It integrates **Flux CD** with **Helm** to achieve automated and declarative continuous delivery. Additionally, a custom Jenkins pipeline is used to automatically detect new Docker image versions and update the Git repository, which Flux then synchronizes with the cluster.

## Key Features
- **GitOps workflow** – the Kubernetes cluster state is driven entirely from a Git repository.  
- **Automated image updates** – Jenkins checks DockerHub for new image tags and commits updated HelmRelease manifests back to Git.  
- **Flux CD reconciliation** – Flux continuously monitors the Git repository and applies the desired state to the cluster.  
- **Cluster-specific configuration** – each Kubernetes cluster has its own folder with HelmRelease manifests, Jenkins pipeline, and Flux system configuration.  
- **Self-hosted Minikube lab** – all deployments are tested and verified locally on Minikube, replicating a real-world GitOps setup.

### PIPELINE:

- Builds and pushes application images to DockerHub (`radeczu/apitestapp`)  
- Checks current deployed version (HelmRelease in Git repo)  
- Compares with the latest available version in DockerHub  
- If a new version is available, Jenkins commits the updated manifest back to GitHub  
- Flux CD reconciles the changes and deploys the update to the cluster automatically

## Repository Structure

```
repo/
├─ charts/ # Helm charts for deploying applications
├─ clusters/ # Cluster-specific deployment configurations
│ └─ minikube/ # Minikube cluster setup
│     ├─ helmrelease-api-app.yaml # HelmRelease manifest for the API app
│     ├─ jenkinsfile # Pipeline that updates the image in HelmRelease when a new version is available
│     ├─ kustomization.yaml
│     └─flux-system/ # Flux manifests for Git reconciliation
│         ├─ gotk-sync.yaml
│         ├─ gotk-components.yaml
│         └─ kustomization.yaml
├─ templates/ # Helm templates for API app manifests
│ └─ api-app.yaml
├─ Chart.yaml # Helm chart metadata
└─ values.yaml # Default values for the Helm chart
```

## How it Works

1. A **local Minikube cluster** is started to simulate a real Kubernetes environment.  
2. **Flux CD** is installed and configured to monitor the repository, specifically the `clusters/minikube/flux-system` folder, which contains the desired cluster state.  
3. The API application is defined as a **Helm chart** under `charts/`, with reusable templates and default configuration in `templates/` and `values.yaml`.  
4. Each cluster (in this case, `minikube`) has its own **HelmRelease manifest**, defining which chart to deploy and which Docker image tag to use.  
5. A **Jenkins pipeline** automatically checks DockerHub for new image versions. When a new tag is detected, it updates the HelmRelease manifest in the Git repository and commits the change.  
6. **Flux CD** continuously reconciles the cluster state with Git, automatically deploying the updated image when Jenkins commits a new version.  

This setup demonstrates a fully automated **GitOps workflow** where multiple clusters can share a common Helm chart but maintain independent deployment configurations. It provides a clean, repeatable, and scalable solution for continuous delivery using Git, Flux CD, Helm, and Jenkins.
