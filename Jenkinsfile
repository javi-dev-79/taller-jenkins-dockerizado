pipeline {
    agent any

    stages {
        stage('Obtener el repositorio') {
            steps {
                git branch: 'main', url: 'https://github.com/javi-dev-79/taller-jenkins.git'
            }
        }
        stage('Construir la documentación') {
            steps {
                sh 'doxygen'
            }
        }
        stage('Archivar la documentación') {
            steps {
                sh 'zip documentation.zip -r html/*'
            }
        }
        // stage('Verificar y crear directorios necesarios') {
        //     steps {
        //         sh '''
        //         ls -l
        //         cd reports
        //         ls -l
        //         '''
        //     }
        // }
	    stage('Análisis estático') {
            steps {
                sh 'make cppcheck-xml'
                // recordIssues enabledForFailure: true, failOnError: true, qualityGates: [[threshold: 1, type: 'TOTAL', unstable: false]], tools: [cppCheck(pattern: 'reports/cppcheck/*.xml')]
                recordIssues sourceCodeRetention: 'LAST_BUILD', tools: [cppCheck(pattern: 'reports/cppcheck/*.html')]
            }
        }
    }
    post {
        success {
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'html/', reportFiles: 'html/', reportName: 'Documentación', reportTitles: ''])
            archiveArtifacts artifacts: 'documentation.zip', allowEmptyArchive: true
        }
    }
}