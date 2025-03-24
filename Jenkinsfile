pipeline {
    agent { label 'windows' }  // Ensures the pipeline runs on a Windows node

    environment {
        DOCKER_IMAGE = "shubham160305/studentproject:latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                bat 'echo Cloning Repository...'
                bat 'git clone https://shubham160305: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github.com/SRCEM-AIML/C3_33_Shubham-Bhagat_Assignment2.git'

            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'echo Building Docker Image...'
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-password', variable: 'DOCKER_PASSWORD')]) {
                    bat 'echo Logging into Docker Hub...'
                    bat 'echo %DOCKER_PASSWORD% | docker login -u shubham160305 --password-stdin'
                }
                bat 'echo Pushing Image to Docker Hub...'
                bat 'docker push %DOCKER_IMAGE%'
            }
        }

        stage('Cleanup') {
            steps {
                bat 'echo Cleaning up...'
                bat 'docker rmi %DOCKER_IMAGE% || echo "No image to remove"'
            }
        }
    }
}
