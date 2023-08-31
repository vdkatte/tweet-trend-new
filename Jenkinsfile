pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
    PATH = "/opt/apache-maven-3.9.4/bin:$PATH"
   }

    stages {
        stage('Clone-code') {
            steps {
                echo 'Hello World'
                
            }
        }
        stage("build"){
            steps {
                 echo "----------- build started ----------"
                sh 'mvn clean deploy'
                 echo "----------- build complted ----------"
            }
    }
    stage("Deploy"){
            steps {
                 echo "----------- Deploy started ----------"
                 
                 echo "----------- Deploy complted ----------"
            }
    }
 }
}
