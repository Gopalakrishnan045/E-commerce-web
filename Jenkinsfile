pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = "gopalakrishnan045/ecommerce"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Gopalakrishnan045/E-commerce-web.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_HUB_REPO}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                docker stop web || true
                docker rm web || true
                docker run -d --name web -p 4200:4200 ${DOCKER_HUB_REPO}:${BUILD_NUMBER}
                """
            }
        }
    }
}
