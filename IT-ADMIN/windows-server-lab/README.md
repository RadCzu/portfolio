# 🖥️ Windows Server Active Directory Lab

This project is a **hands-on lab environment** built to practice Windows Server administration, Active Directory domain management, cloud synchronization with Azure Entra ID, and Linux domain integration.  
It demonstrates a hybrid IT infrastructure with automated user management, group policies, and domain-wide services.

---

## 🔧 Lab Components

### 1. Windows Server (Domain Controller)
- Configured with **Active Directory** domain: `lab.local`
- Integrated with **Azure Entra ID (formerly Azure AD)** for hybrid identity
  - Users and groups are synced to the cloud
  - Their names and groups were based on gimicky WW1 era names.
  - Centralized identity management across on-premise and cloud

### 2. Windows Enterprise Client
- Workstation joined to the `lab.local` domain
- Users authenticate against Active Directory
- Demonstrates typical domain login flow for end users
- User groups have access to their own Samba Folder

### 3. Raspberry Pi (Linux)
- Attached to the Active Directory domain using **Samba**
- Runs **Pi-hole** as a DNS filtering solution for the entire domain
  - Provides ad-blocking and security filtering
  - Integrated with Windows Server DNS for seamless resolution

### 4. Group Policy
- Configured **automatic program installation** via Group Policy Objects (GPO)
- Deployed applications to domain users

---

## 🗂️ Architecture Overview
[ Windows Server (AD DC) ]
|
|
| +--> Azure Entra ID (users & groups synced)
|
[ Windows Enterprise Client ] <--> [ Raspberry Pi ]
|
+--> Samba (domain member)
+--> Pi-hole (DNS filter)


---

## Key Notes
- Setting up a Windows Server with **Active Directory** and domain services
- Configuring **hybrid identity** with **Azure Entra ID**
- Configuring user access levels to specific folders
- Joining both Windows and Linux machines to the same domain
- Deploying and managing services (Samba, Pi-hole) in a mixed environment
- Creating and applying **Group Policies**, including software deployment
- All components were configured manually for maximum learning value.  
- The project simulates a **small enterprise IT environment**, combining on-prem infrastructure with cloud services.  
- Date and Time synchronisation is the most common issue in configuration of Active Directory. 
---

## 🔮 Possible Extensions
- Automate setup with PowerShell or Ansible
- Add monitoring tools (e.g., Grafana + Prometheus for Pi-hole metrics)
- Implement VPN for secure remote access
- Extend Azure integration with conditional access policies

