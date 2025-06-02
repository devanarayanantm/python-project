pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'pwd', usernameVariable: 'usrname')]) {
                    sh '''
                    docker build -t devanarayanantm/pytestimg .
                    docker run -d -p 888:5000 devanarayanantm/pytestimg 
                    docker login -u $usrname -p $pwd
                    '''
                }
            }
        }
        
         
    }    
}
