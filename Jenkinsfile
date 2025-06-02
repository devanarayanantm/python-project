pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'pwd', usernameVariable: 'usrname')]) {
                    sh '''
	            docker login -u $usrname -p $pwd
                    docker build -t devanarayanantm/pytestimg .
                    if docker ps -a | grep "devcont" ;then
			docker stop devcont
			docker rm devcont
		    fi
		    docker run -d --name devcont -p 888:5000 devanarayanantm/pytestimg 
		    docker push devanarayanantm/pytestimg
                    '''
                }
            }
        }
        
         
    }    
}
