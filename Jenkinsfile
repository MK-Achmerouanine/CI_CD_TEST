pipeline {
  agent {
    node {
      label 'project_node'
    }

  }
  stages {
    stage('build source code') {
      agent {
        dockerfile {
          filename 'Build.Dockerfile'
          label 'project_node'
          additionalBuildArgs '--build-arg version=${TAG_NAME}'
          args '-v /tmp:/tmp'
        }

      }
      steps {
        sh 'make run'
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