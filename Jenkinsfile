pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Clone the repository
                git 'https://github.com/nicol144/devops_final_exam_2.git'

                // Build Docker image
                script {
                    docker.build("devops-exam-2:${env.BUILD_ID}")
                }
            }
        }
    }
}
