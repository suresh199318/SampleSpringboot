pipeline {
    agent any

    environment {
        // Define the Docker registry and credentials ID
        DOCKER_REGISTRY = 'https://hub.docker.com/'
        DOCKER_CREDENTIALS_ID = 'docker'
        IMAGE_NAME = 'spring-boot-2-hello-world'
        TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                //checkout([$class: 'GitSCM', 
                  //            branches: [[name: '*/main']], 
                    //          userRemoteConfigs: [[url: 'https://github.com/UpendraKakarla/spring-boot-hello-world-jenkins/main/', credentialsId: "${git}"]]
                    //])
                echo 'checkout done'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the Spring Boot application
                    sh './mvn clean package'

                    // Build the Docker image
                    def app = docker.build("${DOCKER_REGISTRY}/${IMAGE_NAME}:${TAG}")
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    // Log in to the Docker registry
                    docker.withRegistry("https://${DOCKER_REGISTRY}", DOCKER_CREDENTIALS_ID) {
                        // Push the Docker image to the registry
                        app.push()
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace
            cleanWs()
        }
    }
}
