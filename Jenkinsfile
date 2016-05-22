#!groovy
node {
   // Mark the code checkout 'stage'....
   stage 'Checkout'

   // Get some code from a GitHub repository
   //git url: 'https://github.com/snyamars/spring-petclinic.git'
   
   checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'PerBuildTag']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '146ff225-d9c5-4466-9ae0-3ff4c646ff30', url: 'https://github.com/snyamars/spring-petclinic.git']]]

   // Get the maven tool.
   // ** NOTE: This 'M3' maven tool must be configured
   // **       in the global configuration.           
   def mvnHome = tool 'Maven'

   // Mark the code build 'stage'....
   stage 'Build'
   //set the version
   sh "${mvnHome}/bin/mvn versions:set -DnewVersion=1.0.${env.BUILD_NUMBER}"
   // Run the maven build
   sh "${mvnHome}/bin/mvn clean package"
   
   //sh "${mvnHome}/bin/mvn clean install"
   sh "${mvnHome}/bin/mvn release:update-versions -DautoVersionSubmodules=true"
   sh "${mvnHome}/bin/mvn release:prepare"
  
   def fileName = "/var/lib/jenkins/workspace/${env.JOB_NAME}/target/petclinic.war"
   echo "$fileName"
  def word1 = "warfile=${fileName}"
 echo "${word1}"
 
 //ansiblePlaybook credentialsId: 'e3acf4e7-93b7-44ce-9701-63cbce120125', extras: "--extra-vars warfile=${fileName}", installation: 'ansible', inventory: '/home/ubuntu/hosts', playbook: '/home/ubuntu/devops/Ansible-playbooks/tomcat-buntu/site.yml', sudoUser: null
//ansiblePlaybook credentialsId: 'e3acf4e7-93b7-44ce-9701-63cbce120125', extras: '-i "52.91.71.245," --extra-vars "warfile=/var/lib/jenkins/workspace/Pipe1/master/target/petclinic.war target=52.91.71.245"', installation: 'ansible', playbook: '/home/ubuntu/JavaStack/site.yml', sudoUser: null
//ansiblePlaybook credentialsId: 'e3acf4e7-93b7-44ce-9701-63cbce120125', extras: "-i 52.91.71.245, --extra-vars \" ${word1} target=52.91.71.245\"", installation: 'ansible', playbook: '/home/ubuntu/JavaStack/site.yml', sudoUser: null
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
    def fileName = "/var/lib/jenkins/workspace/${env.JOB_NAME}/target/petclinic.war"
     echo "$fileName"
    //sh "cp ${fileName} /tmp/petclinic.war"
    
}
