# Spring Boot CI/CD with Azure Pipelines

This project demonstrates a CI/CD pipeline using **Azure DevOps Pipelines** to build and deploy a Spring Boot + Gradle application.

---

## ⚙️ CI/CD Flow

- ✅ **CI**: On every push to `main`, it:
    - Runs `./gradlew clean build`
    - Publishes the `.jar` as a build artifact

- 🚀 **CD**: After a successful build, it:
    - Copies the `.jar` to your Azure VM via SSH
    - SSHs into the VM and runs the app using `nohup`

---

## 📁 Pipeline File

The `azure-pipelines.yml` contains two stages:

- `Build`: Builds and tests the app
- `Deploy`: Pushes to VM and starts the app

---

## 🔐 SSH Setup (AzureVMConnection)

In Azure DevOps:

1. Go to **Project Settings > Service Connections**
2. Add a new **SSH** connection:
    - Name: `AzureVMConnection`
    - Host: `<your VM public IP>`
    - Username: `azureuser`
    - Private key: (paste private SSH key)
3. On your VM:
   ```bash
   mkdir -p ~/.ssh
   nano ~/.ssh/authorized_keys
