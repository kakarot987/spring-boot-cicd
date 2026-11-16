pipeline {
    agent any

    tools {
        jdk 'jdk-21'
    }

    options {
        timestamps()
    }

    parameters {
        booleanParam(name: 'DEPLOY_ENABLED', defaultValue: false,
                     description: 'Explicitly opt in to remote deployment')
    }

    environment {
        DEPLOY_USER = 'user'
        DEPLOY_HOST = 'your-server.com'
        DEPLOY_DIR = '/home/user/app'
        SSH_KEY_ID = 'my-ssh-key'
    }

    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Build and Test') {
            steps {
                sh 'chmod +x ./gradlew && ./gradlew --no-daemon clean build'
            }
        }
        stage('Archive JAR') {
            steps {
                archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
            }
        }
        stage('Deploy to Remote Server') {
            when { expression { return params.DEPLOY_ENABLED } }
            steps {
                sshagent([env.SSH_KEY_ID]) {
                    sh '''
                        set -eu
                        test "$DEPLOY_HOST" != "your-server.com" || {
                          echo "Configure a real DEPLOY_HOST before deploying" >&2
                          exit 1
                        }
                        ssh -o StrictHostKeyChecking=yes "$DEPLOY_USER@$DEPLOY_HOST" "mkdir -p '$DEPLOY_DIR'"
                        scp -o StrictHostKeyChecking=yes build/libs/*.jar "$DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_DIR/"
                        ssh -o StrictHostKeyChecking=yes "$DEPLOY_USER@$DEPLOY_HOST" \
                          "test -n \"\$(find '$DEPLOY_DIR' -maxdepth 1 -name '*.jar' -print -quit)\""
                    '''
                }
            }
        }
    }
}
