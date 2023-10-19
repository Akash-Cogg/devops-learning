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
                stage('Build and Run Docker Container') {
            steps {
                script {
                    // Define your Docker image name and tag
                    def dockerImageName = 'my-react-app'
                    def dockerImageTag = "1.0.0"  // Use the Jenkins build number as the tag

                    // Build the Docker image from the Dockerfile
                    sh "docker build -t ${dockerImageName}:${dockerImageTag} -f Dockerfile ."

                    // Run the Docker container from the image
                    sh "docker run -d -p 80:80 ${dockerImageName}:${dockerImageTag}"
                }
            }
        }

        stage('Deploy') {
            steps {
                // Deploy your React app to a web server or hosting platformsf
                sh 'cp -r /var/lib/jenkins/workspace/newJob/build/*  /var/www/html'
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
