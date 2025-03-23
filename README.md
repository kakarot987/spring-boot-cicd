# Spring Boot CI/CD Integration Examples

This directory contains configuration files to demonstrate CI/CD integration with a Spring Boot application.

## Structure

- **github-actions/**: GitHub Actions workflow
- **gitlab/**: GitLab CI/CD configuration
- **bitbucket/**: Bitbucket Pipelines config
- **azure/**: Azure Pipelines config
- **aws/**: AWS CodeBuild (buildspec)
- **gcp/**: Google Cloud Build config
- **jenkins/**: Jenkinsfile for pipeline

Each directory contains the necessary files to plug into a working Spring Boot project.

To use:
1. Checkout the matching branch (or copy the config)
2. Adjust credentials/environment as necessary
3. Push to trigger the CI/CD pipeline
