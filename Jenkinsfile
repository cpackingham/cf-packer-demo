pipeline {
  agent {
    docker { image 'node:7-alpine' }
  }

  stages {
    stage('Build') {
      steps {
        echo 'Building golang executor'
      }
    }
    stage('Test') {
      steps {
        echo 'Testing..'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying....'
      }
    }
  }
}