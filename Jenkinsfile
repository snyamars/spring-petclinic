
#!groovy
node {
   // Mark the code checkout 'stage'....
   stage 'Checkout'

   // Get some code from a GitHub repository
   //git url: 'https://github.com/snyamars/spring-petclinic.git'
   
//   checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'PerBuildTag']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '146ff225-d9c5-4466-9ae0-3ff4c646ff30', url: 'https://github.com/snyamars/spring-petclinic.git']]]
checkout changelog: false, poll: false, scm:[$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'PerBuildTag']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '685b8ba9-1d0c-4c5a-b892-7c920da9cea7', url: 'https://github.com/ksnehalakshmi/spring-petclinic.git']]]

   // Get the maven tool.
   // ** NOTE: This 'M3' maven tool must be configured
   // **       in the global configuration.           
   def mvnHome = tool 'M2'

   // Mark the code build 'stage'....
   stage 'Build'
   //set the version
   bat "${mvnHome}/bin/mvn versions:set -DnewVersion=1.0.${env.BUILD_NUMBER}"
   // Run the maven build
   //sh "${mvnHome}/bin/mvn clean package deploy"
   bat "${mvnHome}/bin/mvn release:update-versions -DautoVersionSubmodules=true"
   //sh "${mvnHome}/bin/mvn release:prepare"
  
  //sh "${mvnHome}/bin/mvn clean package"
  
   def fileName = "C:/Users/ka268026/.jenkins/workspace/${env.JOB_NAME}/target/petclinic.war"
   
   echo "$fileName"
  def word1 = "warfile=${fileName}"
  echo "${word1}"
  
  def targetIPAddress = "${targetIPAddress}"
  echo "${targetIPAddress}"
  
  def artifactLocation ="C:/Users/ka268026/.jenkins/workspace/${env.JOB_NAME}/target/petclinic.war"
   
  withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '685b8ba9-1d0c-4c5a-b892-7c920da9cea7', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {

    bat("git tag -a ${env.BUILD_NUMBER}  -m 'Jenkins'")
    bat('git push https://"${GIT_USERNAME}":"${GIT_PASSWORD}"@github.com/snyamars/spring-petclinic.git --tags')
}
  
 // build job: 'CDJob_3', parameters: [[$class: 'StringParameterValue', name: 'targetIPAddress', value:"${targetIPAddress}"], [$class: 'StringParameterValue', name: 'artifactLocation', value:"${artifactLocation}"]]
 
 //ansiblePlaybook credentialsId: 'e3acf4e7-93b7-44ce-9701-63cbce120125', extras: "--extra-vars warfile=${fileName}", installation: 'ansible', inventory: '/home/ubuntu/hosts', playbook: '/home/ubuntu/devops/Ansible-playbooks/tomcat-buntu/site.yml', sudoUser: null
//ansiblePlaybook credentialsId: 'e3acf4e7-93b7-44ce-9701-63cbce120125', extras: '-i "52.91.71.245," --extra-vars "warfile=/var/lib/jenkins/workspace/Pipe1/master/target/petclinic.war target=52.91.71.245"', installation: 'ansible', playbook: '/home/ubuntu/JavaStack/site.yml', sudoUser: null
//ansiblePlaybook credentialsId: 'e3acf4e7-93b7-44ce-9701-63cbce120125', extras: "-i 52.91.71.245, --extra-vars \" ${word1} target=52.91.71.245\"", installation: 'ansible', playbook: '/home/ubuntu/JavaStack/site.yml', sudoUser: null
//ansiblePlaybook credentialsId: 'e3acf4e7-93b7-44ce-9701-63cbce120125', extras: "-i ${targetIPAddress}, --extra-vars \" ${word1} target=${targetIPAddress}\"", installation: 'ansible', playbook: '/home/ubuntu/JavaStack/site.yml', sudoUser: null

}

 //input message: "Does staging look good?"
 stage 'Staging'
  node {
       echo 'Staging server looks to be alive'
      deploy 'Staging'
      echo "Deployed to Staging done"
   }

def deploy(id) {
    //unstash 'war'
    def fileName = "C:/Users/ka268026/.jenkins/workspace/${env.JOB_NAME}/target/petclinic.war"
   
     echo "$fileName"
    //sh "cp ${fileName} /tmp/petclinic.war"
    
}






/* my coding
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

*/
