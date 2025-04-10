pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    environment {
        REGISTRY = 'abhiramikannan'
        IMAGE = 'spring-boot-hello-world'
    }

    stages {
        stage('Build and Test') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Docker Build and Push') {
            when {
                branch 'develop'
            }
            steps {
                script {
                    dockerImage = docker.build("${REGISTRY}/${IMAGE}:${env.BUILD_NUMBER}")
                    docker.withRegistry('', 'dockerhub-credentials-id') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            when {
                branch 'develop'
            }
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
