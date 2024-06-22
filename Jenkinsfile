pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "upendrakakarla/sample2"
        DOCKER_TAG = "${env.BUILD_NUMBER}"
        DOCKER_CREDENTIALS_ID = 'docker' // ID of the Docker registry credentials stored in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from the repository
                git branch: 'main',
                url: 'https://github.com/UpendraKakarla/spring-boot-hello-world-jenkins.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${env.DOCKER_IMAGE}:${env.DOCKER_TAG}")
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    docker.withRegistry('', env.DOCKER_CREDENTIALS_ID) {
                        // Push the Docker image to the registry
                        docker.image("${env.DOCKER_IMAGE}:${env.DOCKER_TAG}").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'The Docker image has been successfully built and pushed.'
        }
        failure {
            echo 'The Docker build or push failed.'
        }
    }
}
