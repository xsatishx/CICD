pipeline {
    agent any
    parameters {
        string(name: 'InstanceType', defaultValue: 'm2.large', description: 'The type of EC2 instance')
    }
    stages {
        stage('build') {
                        steps {
                echo "${params.InstanceType}"
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
