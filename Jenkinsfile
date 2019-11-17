pipeline {
    agent any
    parameters {
        string(name: 'InstanceName', defaultValue: 'TerraformInstance', description: 'The name of the EC2 instance')
    }
    stages {
        stage('build') {
                        steps {
                sh "terraform init"
                sh "terraform plan -out tf.state"
                sh "terraform apply -var /"${params.InstanceType}/" -auto-approve -state=tf.state"
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
