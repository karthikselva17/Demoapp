pipeline {
        agent {
                 label 'node1' // Or 'any', 'none', 'docker', etc.
               }
    
    stages {
            stage('Deploy to ECS') {
                steps {
                // Get some code from a GitHub repository
                sh "terraform init"
                sh "terraform validate"
                sh "terraform plan"
                sh "terraform apply --auto-approve"
                }          
        }
    }
}