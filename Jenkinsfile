pipeline {
  
  agent any
  
  stage {
    stage("build") {
      steps {
        sh 'npm i'
        sh 'npm run build'
      }
    }
  }
}
