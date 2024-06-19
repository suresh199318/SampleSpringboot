pipeline {
    agent any

   // environment {
        // Define the Docker registry and credentials ID
     //   DOCKER_REGISTRY = 'hub.docker.com/'
       // DOCKER_CREDENTIALS_ID = 'docker'
       // IMAGE_NAME = 'spring-boot-2-hello-world-1.0.2-SNAPSHOT'
        //TAG = 'latest'
    //}

    stages {
        stage('Checkout') {
            steps {
                sh 'ls -ltr'
                git branch: 'main',
               url: 'https://github.com/UpendraKakarla/spring-boot-hello-world-jenkins.git'
                echo 'checkout done'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the Spring Boot application
                    sh 'mvn --version'
                    sh 'mvn clean package'
                    echo 'Build on-going..'
                    // Build the Docker image
                    
                    echo 'build done'
                }
            }
        }
        stage('Push') {
            environment {
        // Define the Docker registry and credentials ID
        DOCKER_REGISTRY = 'hub.docker.com/'
        DOCKER_CREDENTIALS_ID = 'docker'
        IMAGE_NAME = 'spring-boot-2-hello-world-1.0.2-SNAPSHOT'
        TAG = 'latest'
                //def app = docker.build("${DOCKER_REGISTRY}/${IMAGE_NAME}:${TAG}")
    }
            steps {
                script {
                    // Log in to the Docker registry
                    echo 'pushing image'
                    def app = docker.build("${DOCKER_REGISTRY}/${IMAGE_NAME}:${TAG}")
                    docker.withRegistry("https://${DOCKER_REGISTRY}", DOCKER_CREDENTIALS_ID) {
                        // Push the Docker image to the registry
                        app.push()
                        echo 'done'
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
