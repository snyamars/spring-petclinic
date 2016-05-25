
stage 'Dev'
node {
 // checkout scm
 // bat 'mvn validate' 
//  bat 'mvn compile'
//  bat 'mvn test'
  //bat 'mvn package'
 // bat 'mvn sonar:sonar'
 
// properties ([$class: 'ParametersDefinitionProperty', parameterDefinitions: [[$class: 'StringParameterDefinition', defaultValue: 'Hello', description: '', name: 'PARAM_NAME']]])
build job: 'Receiver CD3', parameters: [[$class: 'StringParameterValue', name: 'param1', value: "${env.BUILD_NUMBER}"]]

echo "${param1}"
// echo "${env.PARAM_NAME}"
 //echo "${env.NAME}"
 
 echo "${env.BUILD_NUMBER}"
 //echo "${env.param1}"
 //echo "${env.param2}"
  
  //step <object of type hudson.plugins.sonar.SonarRunnerBuilder>
//   dir('target') {stash name: 'war', includes: 'x.war'}
   
}

