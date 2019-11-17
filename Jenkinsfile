pipeline {
    agent any
    parameters {
        string(name: 'InstanceType', defaultValue: 'm2.large', description: 'The type of EC2 instance')
    }
    stages {
        stage('build') {
            steps {
                echo 'Build running'
            }
        } 

	stage('test') {
	   steps {
	       echo 'Testing'
	       }
	}
     
        stage('Deploy') {
	   steps {
	       echo 'Deployed'
	       }
	}

    }
}
