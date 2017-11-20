#!groovy
node {
   // Mark the code checkout 'stage'....hhhwewew
   stage 'Checkout'

   // Get some code from a GitHub repository
   //git url: 'https://github.com/snyamars/spring-petclinic.git'
   
   //checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'PerBuildTag']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '146ff225-d9c5-4466-9ae0-3ff4c646ff30', url: 'https://github.com/snyamars/spring-petclinic.git']]]
   //added Nov 19 2017
   //checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'PerBuildTag'], [$class: 'AuthorInChangelog']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github_id', url: 'https://github.com/snyamars/spring-petclinic.git']]])
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
   sh "${mvnHome}/bin/mvn clean package deploy"
   
   sh "/usr/bin/mvn release:update-versions -DautoVersionSubmodules=true"
   //sh "${mvnHome}/bin/mvn release:prepare"
  
     //sh "${mvnHome}/bin/mvn clean package"
  
   //def fileName = "/var/lib/jenkins/workspace/${env.JOB_NAME}/target/petclinic.war"
   //echo "$fileName"
   //sh "cp ${fileName} /var/lib/jenkins/workspace/petclinic.war"
  //def targetIPAddress = "${targetIPAddress}"
  //echo "${targetIPAddress}"
  
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

       // added Nov 19 2017
   //withDockerRegistry([credentialsId: 'dockerId', url: 'https://hub.docker.com/']) {
    // docker.build('snyamars007/petclinic').push('latest')
      //docker.withRegistry('https://registry.hub.docker.com', 'dockerId') {
       //docker.build('snyamars007/petclinic').push('latest')
    //}
   
   withCredentials([[$class: "UsernamePasswordMultiBinding", usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS', credentialsId: 'dockerId']]) {
      sh 'docker login --username $DOCKERHUB_USER --password $DOCKERHUB_PASS'
    }
    def serverImage = docker.build('snyamars007/petclinic')
    serverImage.push('latest')
    sh 'docker logout'
   }
  //commented on Nov 19 2017  
   /**
  docker.withRegistry('https://hub.docker.com/r/snyamars007', 'f6ab1d37-c2cf-4636-80b9-7745dffd4695') {
        docker.build('petclinic').push('latest')
  }
 
 stage 'run'
   docker.image('petclinic').withRun('-p 9988:8080 stagemonitor/petclinic')
 
 stage 'notifyKubernetes'
   sh  "curl -H 'Content-Type: application/json' -X POST -d '{'id': 'warehouse','application': 'Warehouse Application','accesspoint': 'http://54.165.34.14:8080','containers': [{'name': 'mongod', 'replicas': 1, 'cpu': 1100, 'memory': '170M', 'port': 30071},        {'name': 'nodejs', 'replicas': 1, 'cpu': 1100, 'memory': '500M', 'port': 30064, 'image': 'snyamars007/petclinic'} ]}' http://54.175.227.117:3306/step3"
 
 **/
   
   stage 'notifyKubernetes'
   //sh "kubectl --kubeconfig=~/.kube run spring-petclinic --image=dockersamples/static-site:latest --port=80"
   //sh "kubectl run spring-petclinic --image=dockersamples/static-site:latest --port=80"
   //sh "kubectl expose deployment/spring-petclinic --type=NodePort --port=31220"
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
    //def fileName = "/var/lib/jenkins/workspace/${env.JOB_NAME}/target/petclinic.war"
     //echo "$fileName"
    //sh "cp ${fileName} /tmp/petclinic.war"
    
}

