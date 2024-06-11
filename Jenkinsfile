pipeline {
    agent any

    stages {
        stage('Obtener el repositorio') {
            steps {
                git branch: 'main', url: 'https://github.com/alfonsoalba-cursos/openwebinars-curso-de-jenkins.git'
            }
        }
        stage('Construir la documetación') {
            steps {
                sh "doxygen"
            }

        }

        stage('Archivar la documentación') {
            steps {
                sh "zip documentation.zip -r html/*"
            }
        }

        stage('Análisis estático') {
            steps {
                sh 'make cppcheck-xml'
                recordIssues enabledForFailure: true, failOnError: true, qualityGates: [[threshold: 1, type: 'TOTAL', unstable: false]], tools: [cppCheck(pattern: 'reports/cppcheck/*.xml')]
            }
        }
        stage('Tests unitarios') {
            steps {
                sh 'make tests-xml'
                junit 'reports/cmocka/*.xml'
            }
        }
    }
    post {
        success {
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'html/', reportFiles: 'html/', reportName: 'Documentación', reportTitles: ''])
            archive "documentation.zip"
        }
    }
}