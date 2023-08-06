pipeline {
    agent {
        docker {
            image 'node:14' // You can change this to any image that contains the necessary tools for building your web pages
            args '-p 80:80' // Port mapping for the web server
        }
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/nicol144/devops_final_exam_2.git'
            }
        }

        stage('Build and Deploy') {
            steps {
                sh 'cp -r ./* /usr/share/nginx/html/' // Copy the web pages to the Nginx web server root
            }
        }
    }
}
