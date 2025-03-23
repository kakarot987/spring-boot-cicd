# Spring Boot CI/CD Pipeline with Jenkins

This project demonstrates how to implement a complete **CI/CD pipeline using Jenkins** for a **Spring Boot + Gradle** application.

---

## 🚀 Project Overview

Technologies used:

- Spring Boot
- Gradle
- JDK 21
- Jenkins Pipelines
- SSH-based Deployment

---

## 🧪 Continuous Integration (CI)

The CI process performs the following:

- Checks out code from Git
- Uses JDK 21
- Builds the app using the Gradle wrapper
- Archives the resulting `.jar` for use in deployment

### Jenkinsfile (CI)

```groovy
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Set up JDK 21') {
            tools {
                jdk 'jdk-21' // Ensure 'jdk-21' is configured in Jenkins tools
            }
        }

        stage('Build with Gradle') {
            steps {
                sh './gradlew clean build'
            }
        }

        stage('Archive JAR') {
            steps {
                archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
            }
        }
    }
}
