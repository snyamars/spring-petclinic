import groovy.io.FileType
node {
   // Mark the code checkout 'stage'....
   stage 'Checkout'

   // Get some code from a GitHub repository
   git url: 'https://github.com/snyamars/spring-petclinic.git'

   // Get the maven tool.
   // ** NOTE: This 'M3' maven tool must be configured
   // **       in the global configuration.           
   def mvnHome = tool 'Maven'

   // Mark the code build 'stage'....
   stage 'Build'
   // Run the maven build
   sh "${mvnHome}/bin/mvn clean install"
   def list = []
   def fileName = '/var/jenkins_home/jobs/${JOB_NAME}/workspace'
   def dir = new File(fileName)
      dir.eachFileRecurse (FileType.FILES) { file ->
      list << file
   }
   list.each {
  def fname = it.path
  if(fname.contains('war')){
  $warname= fname
  }
}
   ansiblePlaybook credentialsId: 'e3acf4e7-93b7-44ce-9701-63cbce120125', extras: '--extra-vars warfile=$warpath', installation: 'ansible', inventory: '/home/ubuntu/hosts', playbook: '/home/ubuntu/devops/Ansible-playbooks/tomcat-buntu/site.yml', sudoUser: null

}
