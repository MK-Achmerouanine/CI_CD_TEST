// this will start an executor on a Jenkins agent with the docker label
pipeline {
  agent any
  
  stages {
    stage("build source code") {
      agent {
          // Equivalent to "docker build -f Dockerfile.build --build-arg version=1.0.2 ./build/
          dockerfile {
              filename 'Build.Dockerfile'
              additionalBuildArgs  '--build-arg version=${TAG_NAME}'
              args '-v /tmp:/tmp'
          }
      }
      steps {
        sh "make run"
      }
    }
    stage('build base image') {
      agent {
          node {
              label 'build base agent'
          }
      }
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