pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'pwd', usernameVariable: 'usrname')]) {
                    sh """
	            echo $pwd | docker login -u $usrname --password-stdin
                    docker build -t devanarayanantm/pytestimg .
                    if docker ps -a | grep "devcont"; then
			docker stop devcont
			docker rm devcont
		    fi
		    docker run -d --name devcont -p 888:5000 devanarayanantm/pytestimg 
		    docker push devanarayanantm/pytestimg
                    """
                }
            }
        }

	stage('testt') {
		steps {
			sh """
				if (kubectl get deploy | grep devnndeploy); then
					kubectl delete deploy devnndeploy
				fi
				kubectl create deploy devnndeploy --image=devanarayanantm/pytestimg --replicas=2
				kubectl expose deploy devnndeploy --port 99 --target-port=3000 --type NodePort
			"""
		}
	}        
         
    }    
}

