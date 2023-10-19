pipeline {
    agent any

    environment{
        CI= 'false'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code repository, e.g., from Git
                git(url:'https://github.com/Akash-Cogg/devops-learning.git', branch:'develop')
            }
        }

        stage('Build') {
            steps {
                // Install project dependencies and build the React app
                sh 'npm install'
                sh 'npm run build'
            }
        }

        // stage('Test') {
        //     steps {
        //         // Run tests (e.g., unit tests, integration tests)
        //         sh 'npm test'
        //     }
        // }

        stage('Deploy') {
            steps {
                // Deploy your React app to a web server or hosting platform
             
                sh 'cp /var/lib/jenkins/workspace/newJob/build/*  /var/www/html'
            }
        }
    }

    post {
        success {
            // This block runs when all stages are successful
            echo 'Deployment successful!'
        }
        failure {
            // This block runs when any stage fails
            echo 'Deployment failed!'
        }
    }
}
