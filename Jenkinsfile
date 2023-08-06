pipeline {
    agent {
        docker {
            image 'nginx:latest'
            args '-p 80:80'
        }
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my_web_server:${env.BUILD_NUMBER} .'
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'your-registry-credentials-id', url: 'https://your-docker-registry-url']) {
                        sh "docker tag my_web_server:${env.BUILD_NUMBER} your-docker-registry-url/my_web_server:${env.BUILD_NUMBER}"
                        sh "docker push your-docker-registry-url/my_web_server:${env.BUILD_NUMBER}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Build successful! Pushed Docker image to the registry."
        }
        failure {
            echo "Build failed! Check the Jenkins Console Output for details."
        }
    }
}
