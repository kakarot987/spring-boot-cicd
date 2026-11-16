# GCP Cloud Build + Compute Engine template

Cloud Build uses an explicit Java 21 Gradle build, then `gcloud compute ssh`
and `gcloud compute scp` to transfer a non-plain executable JAR.
The previous pipeline referenced a nonexistent SSH key and disabled host-key
checking; both have been removed. Configure the Cloud Build service account
and target VM's authorized SSH access before use.

**The pipeline intentionally uploads only:** remote service restarts are not
automatic until a dedicated service manager, rollout rollback, and HTTP health
checks are configured. Set `_GCE_USER`, `_GCE_INSTANCE_NAME`,
`_GCE_ZONE`, and `_REMOTE_DIR` for your VM. This is not a verified deployment.
