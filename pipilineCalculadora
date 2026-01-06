pipeline
{
	agent any 
	stages {
		stage ('Checkout'){
			steps{
				checkout scm 
			}
		}
		stage ('Restore'){
			steps{
				sh'dotnet restore projectCalculadora.sln'
			}
		)
		stage ('Build'){
			steps{
				sh'dotnet build  projectCalculadora.sln --configuration Release --no-build'
			}
		)
		stage ('Test'){
			steps{
				sh'dotnet test  calculadoraApp.Tests/calculadoraApp.Tests.csproj --configuration Release --no-build'
			}
		)
		stage ('Publish'){
			steps{
				sh'dotnet publish calculadoraApp/calculadoraApp.csproj -c Release -o publish'
			}
		)
	}
	post{
		success{
			archiveArtifacts artifacrs: 'publish/**',fingerprint:true
		}
	}
}

