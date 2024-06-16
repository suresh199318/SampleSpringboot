pipeline {
    agent any
    triggers {
        githubPush()
    }
    stages {
        stage('Build') {
            steps {
              // Get some code from a GitHub repository
                git 'https://github.com/UpendraKakarla/spring-boot-hello-world-jenkins.git'
                sh 'mvn clean package'
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
    }
}
