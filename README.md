# Spring Boot CI/CD using AWS CodeBuild and CodeDeploy

This project sets up a full CI/CD pipeline on AWS using **CodeBuild** and optionally **CodeDeploy** to build and deploy a Spring Boot application.

---

## 📦 CI with AWS CodeBuild

The build process is defined in `buildspec.yml`. It:

- Installs Java 21
- Runs the Gradle build
- Collects the `.jar` and deployment files as artifacts

---

## 🚀 CD with AWS CodeDeploy (Optional)

To enable CD:

- Create an **EC2 or ECS deployment group** in AWS CodeDeploy
- Add `appspec.yml` and a script like `scripts/deploy.sh` to your repo
- The deploy hook copies files to `/home/ec2-user/app` and starts the app using `nohup`

---

## 🛠️ Setup Guide

### 1. Create CodeBuild Project

- **Source**: Connect to GitHub, Bitbucket, or CodeCommit
- **Environment**: Managed image → Ubuntu, JDK 21
- **Buildspec**: Use `buildspec.yml` from this repo

### 2. (Optional) Create CodeDeploy Setup

- Create Application + Deployment Group
- Target: EC2 with IAM role and S3 access
- Make sure EC2 instance has CodeDeploy agent installed:
  ```bash
  sudo yum install codedeploy-agent
  sudo service codedeploy-agent start
