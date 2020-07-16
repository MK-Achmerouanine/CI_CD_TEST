
pipeline {
  agent any
  stages {
    stage('build source code') {
      steps{
        sh 'docker ps -a'
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