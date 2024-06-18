pipeline {
    agent any
    
    environment {
        // Docker image name and tag
        DOCKER_IMAGE = 'upendrakakarla/spring-boot-app:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the Git repository
                checkout scm
            }
        }

        

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile in the repository
                script {
                    docker.build(https://github.com/UpendraKakarla/spring-boot-hello-world-jenkins/edit/main/Dockerfile)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Login to Docker Hub and push the built Docker image
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PSW')]) {
                    script {
                        sh 'echo $DOCKERHUB_PSW | docker login -u $DOCKERHUB_USER --password-stdin'
                        sh "docker push ${env.DOCKER_IMAGE}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        success {
            echo 'Docker image was built and pushed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
