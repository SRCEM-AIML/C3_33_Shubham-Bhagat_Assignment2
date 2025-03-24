pipeline {
    agent any // Ensure it runs on a Windows node

    environment {
        IMAGE_NAME = 'shubhambhagat05/django_docker'
        CONTAINER_NAME = 'studentproject1'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SRCEM-AIML/C3_33_Shubham-Bhagat_Assignment2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'shubham1', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        bat """
                        docker login -u %DOCKER_USER% -p %DOCKER_PASS%
                        docker push %IMAGE_NAME%
                        """
                    }
                }
            }
        }
    }
}
