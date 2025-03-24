pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'shubhambhagat05/django_docker'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning GitHub repository using SSH...'
                git branch: 'main', credentialsId: 'shubham1', url: 'https://github.com/SRCEM-AIML/C3_33_Shubham-Bhagat_Assignment2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                echo 'Logging in to Docker Hub...'
                withDockerRegistry([credentialsId: 'shubham1', url: '']) {
                    bat 'echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                bat 'docker push %DOCKER_IMAGE%'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleaning up local Docker images...'
                bat 'docker rmi %DOCKER_IMAGE% || echo Cleanup skipped'
            }
        }
    }
}
