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
 
 //     stage("SonarQube analysis") {
 //    environment {
 //      scannerHome = tool 'valaxy-sonar-scanner'
 //    }
 //    steps{
 //    withSonarQubeEnv('valaxy-sonarqube-server') { // If you have configured more than one global server connection, you can specify its name
 //      sh "${scannerHome}/bin/sonar-scanner"
 //    }
 //    }
 //  }
 // }
 }
