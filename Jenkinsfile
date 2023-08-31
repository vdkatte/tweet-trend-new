def registry = 'https://vdkatte.jfrog.io/'
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
      stage("Jar Publish") {
        steps {
            script {
                    echo '<--------------- Jar Publish Started --------------->'
                     def server = Artifactory.newServer url:registry+"/artifactory" ,  credentialsId:"JfrogArtifact-cred"
                     def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}";
                     def uploadSpec = """{
                          "files": [
                            {
                              "pattern": "jarstaging/(*)",
                              "target": "libs-release-local/{1}",
                              "flat": "false",
                              "props" : "${properties}",
                              "exclusions": [ "*.sha1", "*.md5"]
                            }
                         ]
                     }"""
                     def buildInfo = server.upload(uploadSpec)
                     buildInfo.env.collect()
                     server.publishBuildInfo(buildInfo)
                     echo '<--------------- Jar Publish Ended --------------->'  
            
            }
        }   
    } 

  }
}
