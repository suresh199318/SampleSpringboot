pipeline {
    agent any
    git.push();
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

        stage('Build') {
            steps {
                // Use a Docker container with Maven to build the Spring Boot application
                script {
                    docker.image('maven:3.8.5-openjdk-17').inside {
                        sh 'mvn clean package -DskipTests'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile in the repository
                script {
                    docker.build(env.DOCKER_IMAGE)
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
