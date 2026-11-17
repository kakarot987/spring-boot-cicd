# Spring Boot multi-platform CI/CD examples

This repository uses **one branch per CI/CD platform**:

- [GitHub Actions](../../tree/github)
- [GitLab CI](../../tree/gitlab)
- [Jenkins](../../tree/jenkins)
- [Bitbucket Pipelines](../../tree/bitbucket)
- [AWS CodeBuild and CodeDeploy](../../tree/aws)
- [Google Cloud Build](../../tree/gcp)
- [Azure Pipelines](../../tree/azure)

The **main branch** now contains a GitHub Actions CI baseline that runs the Gradle
build and uploads its artifact on pushes and pull requests. The platform branches
are educational deployment examples, not evidence of verified remote deployments.

Never place SSH private keys or production credentials in source. Use the relevant
platform secrets/credential stores, protect production environments, and verify
the target service before enabling deployment. Build/test validation in CI is distinct
from verifying a live remote rollout.
