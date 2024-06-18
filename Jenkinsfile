pipeline {
    agent any
    triggers {
        githubPush()
    }
    stage('Build and Test') {
      steps {
        sh 'ls -ltr'
        // build the project and create a JAR file
        sh 'mvn clean package'
      }
    }
    /*stages {
        stage('Build') {
            steps {
              // Get some code from a GitHub repositor
                sh 'cd mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo Deploying...'
                // Add your deployment script/commands here
            }
        }
    }*/
     environment {
        DOCKERHUB_CREDENTIALS = credentials('docker')
        DOCKER_IMAGE = 'upendrakakarla/spring-boot-2-hello-world:latest'
    }

    stages {
       /* stage('Build') {
            steps {
                script {
                    docker.image('maven:3.8.5-openjdk-11').inside {
                        sh 'mvn clean package'
                    }
                }
            }
        }*/

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
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
