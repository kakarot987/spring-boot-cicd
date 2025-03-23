# Spring Boot CI/CD with Bitbucket Pipelines

This project demonstrates a complete CI/CD pipeline using **Bitbucket Pipelines** for a **Spring Boot + Gradle** application.

---

## 🧪 CI: Continuous Integration

The first step builds the project and runs tests:

- Uses OpenJDK 21
- Executes `./gradlew clean build`
- Caches Gradle dependencies
- Stores the generated JAR file as an artifact

---

## 🚀 CD: Continuous Deployment

The second step deploys the JAR to a remote server via SSH:

- Uses `scp-deploy` to copy the JAR to the server
- Uses `ssh-run` to kill the existing process and restart the app using `nohup`

---

## 🛠️ Setup Instructions

### 1. Enable Bitbucket Pipelines

Go to **Repository Settings → Pipelines**, and enable it.

### 2. Add Repository Variables

Under **Repository Settings → Repository Variables**, define:

| Name        | Example             | Required | Description                        |
|-------------|---------------------|----------|------------------------------------|
| `SSH_USER`  | `ubuntu`            | ✅       | Your remote SSH username           |
| `SSH_HOST`  | `192.168.1.100`     | ✅       | IP/domain of the deployment server |
| `DEPLOY_DIR`| `/home/ubuntu/app`  | ✅       | Path where the JAR will be deployed |

### 3. Add SSH Key Access

- In **Settings → SSH Keys**, add your server's private key under "SSH Key Settings".
- Also add the **public key** to `~/.ssh/authorized_keys` on your server.

---

## 📂 Artifacts

The compiled `.jar` is saved as a pipeline artifact:

```bash
build/libs/*.jar
