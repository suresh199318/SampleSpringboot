pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "upendrakakarla/sample2"
        DOCKER_TAG = "${env.BUILD_NUMBER}"
        DOCKER_CREDENTIALS_ID = 'docker' // ID of the Docker registry credentials stored in Jenkins
        //MAVEN_HOME = tool 'Maven 3' // Name of the Maven installation in Jenkins
        //JAVA_HOME = tool 'JDK11' // Name of the JDK installation in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from the repository
                git branch: 'main',
                url: 'https://github.com/UpendraKakarla/spring-boot-hello-world-jenkins.git'
            }
        }
        stage('Build with Maven') {
            steps {
                script {
                    // Run Maven build
                   // withEnv(["PATH+MAVEN=${MAVEN_HOME}/bin", "JAVA_HOME=${JAVA_HOME}"]) {
                        sh 'mvn clean package'
                   // }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${env.DOCKER_IMAGE}:${env.DOCKER_TAG}", '--no-cache .')
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
