# AWS CodeBuild + CodeDeploy branch

The CodeBuild artifact includes `build/libs/*.jar`, `appspec.yml`, and
`scripts/**/*`. CodeDeploy copies the artifact into `/home/ec2-user/app`,
so the packaged JAR lives at `/home/ec2-user/app/build/libs/*.jar`.

The AfterInstall script fails safely if no JAR exists or a dedicated
`spring-boot-app.service` systemd unit has not been configured. The unit
should use an executable JAR from that directory and run as a dedicated
non-root user with appropriately scoped permissions.

Configure CodeDeploy, the instance IAM role, artifact storage, and unit
permissions independently. Do not enable deployment until the target VM
service and application health checks have been validated. This branch
does not prove a successful AWS deployment.
