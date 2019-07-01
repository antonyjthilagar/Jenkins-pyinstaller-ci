pipeline {
agent any
stages {
stage('Build') {
  steps {
    sh 'python -m py_compile server.py'
  }
}
stage('Create Installer') {
  steps {
    sh 'pyinstaller --onefile server.py'
  }
}
stage('Copy Artifacts') {
  steps {
    sh 'cp index.html dist/'
  }
}
stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    def customImage = docker.build("pyapp:${env.BUILD_ID}")
                }
            }
        }
stage('Stop Running Container') {
            steps {
                sh 'docker rm -f web'
            }
        }
stage('Depoly') {
            steps {
                sh 'docker run -d -p 8000:8000 --name=web --restart=always pyapp:${BUILD_NUMBER}'
            }
        }
}
}
