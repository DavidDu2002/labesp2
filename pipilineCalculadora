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
                bat 'dotnet restore projectCalculadora.sln'
            }
        }

        stage('Build') {
            steps {
                bat 'dotnet build projectCalculadora.sln --configuration Release'
            }
        }

        stage('Test') {
            steps {
                bat 'dotnet test calculadoraApp.Tests\\calculadoraApp.Tests.csproj --configuration Release --no-build'
            }
        }

        stage('Publish') {
            steps {
                bat 'dotnet publish calculadoraApp\\calculadoraApp.csproj --configuration Release --output publish'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'publish/**', fingerprint: true
        }
    }
}
