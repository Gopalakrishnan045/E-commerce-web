pipeline {
    agent any

    environment {
        // Use the credentials you added in Jenkins (username + token)
        DOCKERHUB = credentials('dockerhub-credentials-id')
        IMAGE     = "your-dockerhub-username/your-app"
        TAG       = "${env.BUILD_NUMBER}"   // use build number as tag
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Gopalakrishnan045/E-commerce-web.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE}:${TAG} ."
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh """
                  echo ${DOCKERHUB_PSW} | docker login -u ${DOCKERHUB_USR} --password-stdin
                  docker push ${IMAGE}:${TAG}
                  # also tag latest
                  docker tag ${IMAGE}:${TAG} ${IMAGE}:latest
                  docker push ${IMAGE}:latest
                """
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                  docker rm -f myapp || true
                  docker run -d --name myapp -p 8080:8080 ${IMAGE}:${TAG}
                """
            }
        }
    }
}

