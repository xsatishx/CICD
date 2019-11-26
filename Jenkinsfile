pipeline {
  agent any
  stages {
    stage('Build Infrastructure') {
      steps {
        sh "sudo terraform init"
        sh "sudo terraform plan"
                //sh "sudo terraform apply -auto-approve"
                //sh "terraform apply -var \"name=${params.InstanceName}\" -auto-approve"
            }
    } 

	stage('test') {
	  steps {
	    echo 'Testing'
        echo "sleep 10"
        echo "Test passed... "
	       }
	}
     
    stage('Deploy To Dev') {
      steps {
	  echo 'Deployed'
	       }
	}

    stage ('Deploy To Prod'){
    input {
      message "Do you want to proceed for production deployment?"
      }
    steps {
           sh 'echo "Deploy into Prod"'
           }
    }
  }
   }
}
