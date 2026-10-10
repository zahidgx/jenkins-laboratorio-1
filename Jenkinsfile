pipeline {
    agent any
    stages {
        stage('Validar script') {
            steps {
                sh 'sh -n hola-mundo.sh'
            }
        }
        stage('Hola Mundo') {
            steps {
                sh 'sh hola-mundo.sh'
            }
        }
        stage('Comprobar resultado') {
            steps {
                sh '''
                    output="$(sh hola-mundo.sh)"
                    test "$output" = 'Hola Mundo'
                '''
            }
        }
    }
    post {
        success { echo 'Laboratorio 1 finalizado correctamente' }
        failure { echo 'Error en el laboratorio: revisar Console Output' }
    }
}
