pipeline {
  agent {
    node {
      label 'project_node'
    }

  }
  stages {
    stage('build source code') {
      agent {
<<<<<<< HEAD
          // Equivalent to "docker build -f Dockerfile.build --build-arg version=1.0.2 ./build/
          dockerfile {
              filename 'Build.Dockerfile'
          }
=======
        dockerfile {
          filename 'Build.Dockerfile'
          label 'project_node'
          additionalBuildArgs '--build-arg version=${TAG_NAME}'
          args '-v /tmp:/tmp'
        }

>>>>>>> 8b1f0c3ab588d8e1d8e124e2d7b6b1a8fa626519
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