pipeline {
    agent any
    triggers {
        githubPush()
    }

     environment {
        DOCKERHUB_CREDENTIALS = credentials('docker')
        DOCKER_IMAGE = 'upendrakakarla/spring-boot-2-hello-world:latest'
    }

    stages {

        stage('Build and Test') {
      steps {
        sh 'ls -ltr'
        // build the project and create a JAR file
        sh 'mvn clean package'
      }
    }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(Dockerfile)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/', 'DOCKERHUB_CREDENTIALS') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).run('-p 8081:8080')
                }
            }
        }
    }
}
