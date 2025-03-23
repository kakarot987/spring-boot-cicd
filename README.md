# Spring Boot CI/CD on Google Cloud with Cloud Build

This project demonstrates CI/CD using **Google Cloud Build** to deploy a Spring Boot + Gradle application to a GCE virtual machine over SSH.

---

## ✅ CI/CD Flow

1. **CI**: Cloud Build runs `./gradlew clean build`
2. **CD**:
    - Copies JAR file to a GCE VM via `scp`
    - SSHs into the VM
    - Kills any running Spring Boot app
    - Starts the new version in the background

---

## 📄 Files

. ├── cloudbuild.yaml # Cloud Build config ├── build/libs/ # JAR built by Gradle └── src/ # App source

---

## 🔐 SSH Key Setup

1. Generate SSH key (if not yet done):

   ```bash
   ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa