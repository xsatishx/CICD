pipeline {
    agent any
   
    stages {
        stage('build') {
                        steps {
                sh "sudo terraform init"
                sh "sudo terraform plan"
                sh "sudo terraform apply -auto-approve"
                //sh "terraform apply -var \"name=${params.InstanceName}\" -auto-approve"
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
