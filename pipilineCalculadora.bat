pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Restore') {
            steps {
                sh 'dotnet restore projectCalculadora.sln'
            }
        }

        stage('Build') {
            steps {
                sh 'dotnet build projectCalculadora.sln --configuration Release'
            }
        }

        stage('Test') {
            steps {
                sh 'dotnet test CalculadoraApp.Test/CalculadoraApp.Test.csproj --configuration Release --no-build'
            }
        }

        stage('Publish') {
            steps {
                sh 'dotnet publish CalculadoraApp/CalculadoraApp.csproj -c Release -o publish'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'publish/**', fingerprint: true
        }
    }
}

