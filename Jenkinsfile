pipeline {
    agent any

    environment {
        DEPLOY_USER = 'user'                     // replace with your SSH username
        DEPLOY_HOST = 'your-server.com'          // replace with your server IP or domain
        DEPLOY_DIR  = '/home/user/app'           // remote directory to deploy the jar
        SSH_KEY_ID  = 'my-ssh-key'               // Jenkins credentials ID for SSH key
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Set up JDK 21') {
            tools {
                jdk 'jdk-21'                     // make sure JDK 21 is configured in Jenkins
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

        stage('Deploy to Remote Server') {
            steps {
                sshagent([env.SSH_KEY_ID]) {
                    sh '''
                    echo "Copying JAR to remote server..."
                    scp build/libs/*.jar $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_DIR/

                    echo "Restarting app on remote server..."
                    ssh $DEPLOY_USER@$DEPLOY_HOST <<EOF
                    pkill -f 'java -jar' || true
                    nohup java -jar $DEPLOY_DIR/*.jar > $DEPLOY_DIR/app.log 2>&1 &
                    EOF
                    '''
                }
            }
        }
    }
}
