pipeline {
    agent any
    parameters {
        string(name: 'InstanceName', defaultValue: 'TerraformInstance', description: 'The name of the EC2 instance')
    }
    stages {
        stage('build') {
                        steps {
                sh "terraform init"
                sh "terraform plan -var \"name=\"${params.InstanceName}\"\" -out terraform.tfstate"
                sh "terraform apply -var \"name=\"${params.InstanceName}\"\" -auto-approve"
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
