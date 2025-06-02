@Library('pytest') _
pipeline {
    agent any

    stages {
        stage('test') {
            steps {
                pyTest()
                sh ' echo "Pytest done" '
            }
        }
        
    }
    
    
}
