// this will start an executor on a Jenkins agent with the docker label
pipeline {
  agent any
  
  stages {
    stage("Env Variables") {
      steps {
        sh "cd app/"
        sh "go build -o app"
      }
    }
    stage('build base image') {
      steps {
        sh 'make build-base'
      }
    }
    stage('run tests') {
      steps {
        sh 'make build-test'
        sh 'make test-unit'
        sh 'ls'
        junit 'report/report.xml'
      }
    }
    stage('build image') {
      steps {
        sh 'make build'
      }
    }
  }
}