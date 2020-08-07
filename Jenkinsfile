node {

  stage('Checkout') {
    git url:'https://github.com/dguia18/AplicacionDulcesYMas.git',branch: 'master'
  }
  //SignusFinanciero.sln
  stage ('Restore Nuget') {
    bat "dotnet restore AplicacionDulcesYMas.sln"
  }
  
  stage('Clean') {
    bat 'dotnet clean AplicacionDulcesYMas.sln'
  }
  
  stage('Build') {
    bat 'dotnet build AplicacionDulcesYMas.sln --configuration Release'
  }

  stage ('Test') {
    bat "dotnet test CompositeDulcesTest/DomainTest.csproj /p:CollectCoverage=true /p:CoverletOutputFormat=opencover --logger trx;LogFileName=unit_tests.trx"

    bat "dotnet test ApplicationTest/ApplicationTest.csproj /p:CollectCoverage=true /p:CoverletOutputFormat=opencover --logger trx;LogFileName=unit_tests.trx"
 
    mstest testResultsFile:"**/*.trx", keepLongStdio: true
  }
    
	stage ('Sonarqube'){
		bat "dotnet sonarscanner begin /k:'dulcesYmasApp' /d:sonar.cs.opencover.reportsPaths='CompositeDulcesTest/coverage.opencover.xml,ApplicationTest/coverage.opencover.xml' /d:sonar.test.exclusions='test/**'  /d:sonar.login='fdc31df67702e5ef20503914a33c046d61d3c5e5'"
	}

  stage('Publish') {
    bat 'dotnet publish WebApiAngular/WebApiAngular.csproj -c Release -o C:/DeployDulcesYmas'
  } 
  
}