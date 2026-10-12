pipeline {
    agent any

    environment {
        // Automatically fetch git branch/commit info
        IMAGE_NAME = "oav-web"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out source code from Git...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker container...'
                dir('docker') {
                    // Uses your docker-compose file to build the web image
                    sh 'docker-compose build --no-cache'
                }
            }
        }

        stage('Run & Verify Containers') {
            steps {
                echo 'Starting application containers...'
                dir('docker') {
                    // Updated to docker-compose to match the installed binary
                    sh 'docker-compose up -d --force-recreate'
                }
            }
        }

        stage('Health Check') {
            steps {
                echo 'Verifying application container status...'
                sh 'docker ps --filter name=oav_web'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully! Your application container is up and running.'
        }
        failure {
            echo 'Pipeline failed. Please check the Docker logs for oav_web.'
        }
    }
}
