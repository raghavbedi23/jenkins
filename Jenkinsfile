pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('') {
                        def dockerImage = docker.build("my_web_server:${env.BUILD_NUMBER}", '.')
                        dockerImage.push()
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
