#!groovy
node {
  
   // Mark the code checkout 'stage'....
   stage 'Checkout'

   checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github_id', url: 'https://github.com/snyamars/spring-petclinic.git']]])

   // Get the maven tool.
   // ** NOTE: This 'M3' maven tool must be configured
   // **       in the global configuration.           
   //def mvnHome = tool 'Maven'

   // Mark the code build 'stage'....
   stage 'Build'
   
   //set the version
   sh "/usr/bin/mvn versions:set -DnewVersion=1.0.${env.BUILD_NUMBER}"
   
   // Run the maven build
   //sh "/usr/bin/mvn clean package deploy"
   sh "/usr/bin/mvn clean package"
   
   sh "/usr/bin/mvn release:update-versions -DautoVersionSubmodules=true"
   //sh "${mvnHome}/bin/mvn release:prepare"
  
  stage 'tag in git'
  /**
  withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '146ff225-d9c5-4466-9ae0-3ff4c646ff30', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) 
  {
    sh("git tag -a ${env.BUILD_NUMBER}  -m 'Jenkins'")
    sh('git push https://"${GIT_USERNAME}":"${GIT_PASSWORD}"@github.com/snyamars/spring-petclinic.git --tags')
  }
  //commented on Nov 19 2017
  **/

   stage ('docker build'){

      withCredentials([[$class: "UsernamePasswordMultiBinding", usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS', credentialsId: 'dockerId']]) {
      sh 'docker login --username $DOCKERHUB_USER --password $DOCKERHUB_PASS'
    }
    def serverImage = docker.build('snyamars007/petclinic')
    serverImage.push('latest')
    sh 'docker logout'
   }
  
   
   stage 'notifyKubernetes'
     try{
      sh "kubectl delete deployment spring-petclinic-test1"
   }catch(e){
      println("no prior deployment exists")
   }
   sh "sleep 3s"
   sh "kubectl run --image=snyamars007/petclinic:latest spring-petclinic-test1  --port=9966"
   sh "kubectl expose deployment spring-petclinic-test1 --type=NodePort "

}//end of node
