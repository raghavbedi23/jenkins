#!/usr/bin/env groovy

pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the repository from your Git repository URL
                git 'https://github.com/nicol144/devops_final_exam_2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile from the repository
                script {
                    def dockerImage = docker.build("my_web_app_image:${env.BUILD_ID}", "-f Dockerfile .")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container from the built image with port 8000 mapped to the host
                script {
                    dockerImage.run('-p 8000:80 -d --name my_web_app_container')
                }
            }
        }
    }
}
