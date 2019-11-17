pipeline {
    agent any
   
    stages {
        stage('build') {
                        steps {
                sh "terraform init"
                sh "terraform plan"
               // sh "terraform apply -var \"name=${params.InstanceName}\" -auto-approve"
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
