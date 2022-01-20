pipeline {
    agent any

    // add timestamps to the console log
    options {
        timestamps()
    }

    stages {
        stage('Deploy') {
            steps {
                sh "cd prod"
                sh "terraform init"
                sh "terraform plan"
                sh "terraform apply"
            }
        }
    }
}