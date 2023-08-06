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
                sh "docker build -t my_web_server:${env.BUILD_NUMBER} ."
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker_cred', url: '']) {
                        sh "docker login -u adi144 -p 'Pitaji144\$'"
                        sh "docker tag my_web_server:${env.BUILD_NUMBER} adi144/my_web_server:${env.BUILD_NUMBER}"
                        sh "docker push adi144/my_web_server:${env.BUILD_NUMBER}"
                        sh "docker logout"
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
