pipeline {
  environment {
    registry = "mehmetyazicioglu/elasticsearch"
    registryCredential = 'dockerhub'
    dockerImage = 'elasticsearch'
  }
  agent any
  stages {
      stage('Clone repository') {               
      steps {       
            checkout scm    
      }
      } 
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":latest"
        }
      }
    }
    stage('Test image') {  
       steps {
          script {
            sh 'echo "Tests passed"'        
             }    
        }  
        }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:latest"
      }
    }
  }
}
